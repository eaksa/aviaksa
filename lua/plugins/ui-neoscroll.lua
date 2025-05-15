local M = {
    "karb94/neoscroll.nvim",
	-- 15 May 2025
	commit = "f957373912e88579e26fdaea4735450ff2ef5c9c",
    event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    local status_ok, neoscroll = pcall(require, "neoscroll")
    if not status_ok then
        return
    end

    local config = require("neoscroll.config")

    neoscroll.setup({
        mappings = {},
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
    })

	-- FIXME: set_mappings() is deprecated
    -- config.set_mappings({
    --     ["<S-j>"] = { "scroll", { "vim.wo.scroll", "true", "100" } },
    --     ["<S-k>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } },
    --     -- ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } },
    --     -- ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } },
    --     -- ["zt"] = { "zt", { "100" } },
    --     -- ["zz"] = { "zz", { "100" } },
    --     -- ["zb"] = { "zb", { "100" } },
    -- })
end

return M
