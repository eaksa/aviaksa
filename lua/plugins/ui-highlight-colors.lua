local M = {
    "brenoprata10/nvim-highlight-colors",
	-- 15 May 2025
	commit = "b42a5ccec7457b44e89f7ed3b3afb1b375bb2093",
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
}

function M.config()
    local highlight_colors = require("nvim-highlight-colors")
    highlight_colors.setup({
        enable_named_colors = false,
    })
    highlight_colors.turnOn()
end

return M
