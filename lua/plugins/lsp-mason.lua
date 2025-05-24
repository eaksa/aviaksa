local M = {
    "williamboman/mason.nvim",
	version = "^2.0.0",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            lazy = true,
        },
    },
}

local settings = {
    ui = {
        -- border = { "", "█", "", "█", "", "█", "", "█" },
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

function M.config()
    require("mason").setup(settings)
    require("mason-lspconfig").setup({
        ensure_installed = require("lsp.install").servers,
        automatic_installation = true,
    })
end

return M
