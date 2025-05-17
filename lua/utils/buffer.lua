local M = {}

local function notify_modified()
    local msg =
        "Unpinned buffer is modified. Write or pin buffer before navigating away"
    vim.notify(msg, vim.log.levels.WARN)
end

local buffer = require("barbar.state")

M.prev_buffer = function()
    M.eval_unmodified("BufferPrevious")
end

M.next_buffer = function()
    M.eval_unmodified("BufferNext")
end

M.alt_buffer = function()
    M.eval_unmodified("b#")
end

M.goto_buffer = function(n)
    M.eval_unmodified("BufferGoto " .. n)
end

M.exec_unmodified = function(f)
    if vim.bo.modified and not buffer.is_pinned(0) then
        notify_modified()
        return
    end
    f()
end

M.eval_unmodified = function(cmd)
    if vim.bo.modified and not buffer.is_pinned(0) then
        notify_modified()
        return
    end
    vim.cmd(cmd)
end

-- Closes focused buffer or, if in Zen Mode, exits Zen Mode. If there is only
-- one remaining buffer, quits Neovim.
M.close_focused = function()
    -- Close Zen Mode
    local zen_mode = require("zen-mode.view")
    if zen_mode.is_open() then
        zen_mode.close()
        return
    end

    -- Get number of listed buffers excluding NvimTree
    local buf_count = function()
        local buffers = vim.fn.getbufinfo({
            bufloaded = 1,
            buflisted = 1,
        })
        local nvim_tree = require("nvim-tree.api").tree
        local count = 0
        for _, buf in ipairs(buffers) do
            if not nvim_tree.is_tree_buf(buf.bufnr) then
                count = count + 1
            end
        end
        return count
    end

    -- Get number of windows (splits) that are file-editing buffers
    local win_count = function()
        local count = 0
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufnr = vim.api.nvim_win_get_buf(win)
            if vim.bo[bufnr].buftype == "" then -- Check if the buffer is a file-editing buffer
                count = count + 1
            end
        end
        return count
    end

    if win_count() > 1 then
        -- Close the current window if it has not been modified
        local bufnr = vim.api.nvim_get_current_buf()
        if not vim.bo[bufnr].modified then
            vim.cmd("close")
        else
            notify_modified()
        end
        return
    end

    if buf_count() > 1 then
        local nvim_tree = require("nvim-tree.api").tree
        local is_nvim_tree = nvim_tree.is_tree_buf(0)
        if is_nvim_tree then
            -- Close NvimTree
            nvim_tree.close()
        else
            -- Write to file if buffer has been modified
            local bufnr = vim.api.nvim_get_current_buf()
            if vim.bo[bufnr].modified then
                vim.cmd("write")
            end
            if buffer.is_pinned(0) then
                vim.cmd("BufferClose")
            end
            pcall(function()
                vim.cmd("BufferCloseAllButPinned")
            end)
        end
    else
        -- If only one buffer remaining and no splits, quit Neovim
        vim.cmd("quit")
    end
end

M.term_window_is_full_screen = function()
    local handle = io.popen(
        "yabai -m query --windows --window | jq -c '.[\"is-native-fullscreen\"]'"
    )
    if not handle then
        return
    end
    -- TODO: Implementation for other WMs
    local result = handle:read("*a")
    handle:close()
    if string.find(result, "true") then
        return true
    else
        return false
    end
end

M.enter_full_screen = function()
    if M.term_window_is_full_screen() == false then
        os.execute("yabai -m window --toggle native-fullscreen")
        -- TODO: Implementation for other WMs
    end
end

M.exit_full_screen = function()
    if M.term_window_is_full_screen() then
        os.execute("yabai -m window --toggle native-fullscreen")
        -- TODO: Implementation for other WMs
    end
end

return M
