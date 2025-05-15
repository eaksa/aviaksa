local M = {}

function M.setup(config)
	-- Load opts
	require("config.options")
	vim.g.mapleader = config.leader or " "

	-- Bootstrap lazy.nvim
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			lazyrepo,
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	-- Setup lazy.nvim
	require("lazy").setup({
		spec = {{ import = "plugins" }},
		install = {
			-- install missing plugins on startup. This doesn't increase
			-- startup time.
			missing = true,
			-- try to load one of these colorschemes when starting an
			-- installation during startup
			colorscheme = { "tokyonight" },
		},
	})
end

return M
