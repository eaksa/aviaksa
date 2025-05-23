local M = {
	"AckslD/swenv.nvim",
	-- 23 May 2025
	commit = "4157de2619ec2e5c61c103fb6517845a0e04e558",
	dependencies = {
		"nvim-lua/plenary.nvim",
	}
}

function M.config()
	local swenv = require("swenv")
	swenv.setup({
		-- attempt to auto create and set a venv from dependencies
		auto_create_venv = false,
		-- name of venv directory to create if using pip
		auto_create_venv_dir = ".venv"
	})
end

return M
