local M = {
	"shortcuts/no-neck-pain.nvim",
	version = "^2.4.2",
}

function M.config()
	local no_neck_pain = require("no-neck-pain")
	no_neck_pain.setup({
	-- 	autocmds = {
	-- 		enableOnVimEnter = "safe",
	-- 	},
		mappings = {
			enabled = true,
			toggle = "<leader>z",
		},
	})
end

return M
