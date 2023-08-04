local M = {
    -- 25 Jul 2023
    "williamboman/mason.nvim",
    commit = "fe9e34a9ab4d64321cdc3ecab4ea1809239bb73f",
    cmd = "Mason",
    event = "BufReadPre",
    dependencies = {
        {
            -- 21 Jul 2023
            "williamboman/mason-lspconfig.nvim",
            commit = "e86a4c84ff35240639643ffed56ee1c4d55f538e",
            lazy = true,
        },
    },
}

local settings = {
    ui = {
        border = { "", "█", "", "█", "", "█", "", "█" },
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
