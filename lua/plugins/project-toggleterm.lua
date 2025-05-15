local M = {
    "akinsho/toggleterm.nvim",
    -- 15 May 2025
	commit = "9a88eae817ef395952e08650b3283726786fb5fb",
    event = "VeryLazy",
}

function M.config()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
        return
    end
    local hl = require("utils.hl")

    vim.api.nvim_set_hl(0, "FloatBorder", { fg = hl.gui_bg("NormalFloat") })

    toggleterm.setup({
        size = 20,
        open_mapping = [[<C-t>]],
        hide_numbers = true,
        shade_terminals = false,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            -- border = "curved",
            border = { "", "█", "", "█", "", "█", "", "█" },
        },
        highlights = {
            NormalFloat = {
                guifg = hl.gui_fg("NormalFloat"),
                guibg = hl.gui_bg("NormalFloat"),
            },
            FloatBorder = {
                guifg = hl.gui_fg("FloatBorder"),
                -- guibg = hl.gui_bg("FloatBorder"),
            },
        },
    })

    function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return M
