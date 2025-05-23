local M = {
	"mawkler/modicator.nvim",
	-- 23 May 2025
	commit = "45b64561e109cd04de551b081fb947b4f856009e",
	dependencies = {
		"folke/tokyonight.nvim",
	},
	init = function()
	-- These are required for Modicator to work
		vim.o.cursorline = true
		vim.o.number = true
		vim.o.termguicolors = true
	end,
}

return M
