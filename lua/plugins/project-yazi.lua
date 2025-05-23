local M = {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		"folke/snacks.nvim"
	},
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"ge",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		-- {
		-- 	-- Open in the current working directory
		-- 	"<leader>cw",
		-- 	"<cmd>Yazi cwd<cr>",
		-- 	desc = "Open the file manager in nvim's working directory",
		-- },
		-- {
		-- 	"<c-up>",
		-- 	"<cmd>Yazi toggle<cr>",
		-- 	desc = "Resume the last yazi session",
		-- },
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
			open_file_in_vertical_split = "L",
			open_file_in_horizontal_split = false,
			open_file_in_tab = false,
			grep_in_directory = "gt",
			replace_in_directory = false,
			cycle_open_buffers = false,
			copy_relative_path_to_selected_files = "<c-y>",
			send_to_quickfix_list = "<c-q>",
			change_working_directory = "<c-\\>",
			open_and_pick_window = "<c-o>",
		},
	},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}

return M
