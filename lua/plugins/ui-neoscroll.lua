local M = {
    "karb94/neoscroll.nvim",
	-- 15 May 2025
	commit = "f957373912e88579e26fdaea4735450ff2ef5c9c",
    event = { "VimEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    local status_ok, neoscroll = pcall(require, "neoscroll")
    if not status_ok then
        return
    end

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

	local keymap = {
		["<S-j>"] = function() neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 100 }) end;
		["<S-k>"] = function() neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 100 }) end;
		["<C-u>"] = function() neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 100 }) end;
		["<C-d>"] = function() neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 100 }) end;
		["zt"] = function() neoscroll.zt({ half_win_duration = 100 }) end;
		["zz"] = function() neoscroll.zz({ half_win_duration = 100 }) end;
		["zb"] = function() neoscroll.zb({ half_win_duration = 100 }) end;
	}
	for key, func in pairs(keymap) do
		vim.keymap.set({"n", "v", "x"}, key, func, { silent = true, noremap = true })
	end
end

return M
