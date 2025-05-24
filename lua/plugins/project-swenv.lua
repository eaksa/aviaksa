local M = {
	"AckslD/swenv.nvim",
	-- 23 May 2025
	commit = "4157de2619ec2e5c61c103fb6517845a0e04e558",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ahmedkhalf/project.nvim",
	}
}

function M.config()
	local swenv = require("swenv")
	swenv.setup({
		-- attempt to auto create and set a venv from dependencies
		auto_create_venv = false,
		post_set_venv = function()
			local client = vim.lsp.get_clients({ name = "pyright" })[1]
			if not client then
				return
			end
			local venv = require("swenv.api").get_current_venv()
			if not venv then
				return
			end
			local venv_python = venv.path .. "/bin/python"
			if client.settings then
				client.settings = vim.tbl_deep_extend("force", client.settings, { python = { pythonPath = venv_python } })
			else
				client.config.settings =
					vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = venv_python } })
			end
			client.notify("workspace/didChangeConfiguration", { settings = nil })
		end,
	})
end

return M
