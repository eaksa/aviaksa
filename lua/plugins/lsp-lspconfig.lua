local M = {
    "neovim/nvim-lspconfig",
	version = "^2.1.0",
    commit = "a59d74e12340242c0735666fb2e91afdbe6f2496",
    lazy = true,
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
        },
    },
}

function M.config()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

    local function lsp_keymaps(bufnr)
        local keymaps = require("keybinds.lsp")
        local map = require("keybinds.utils")
        for mode, keymap in pairs(keymaps) do
            map.mode_set(mode, keymap, bufnr)
        end
    end

    local lspconfig = require("lspconfig")
    local on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        require("illuminate").on_attach(client)
    end

    for _, server in pairs(require("lsp.install").servers) do
        Opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, "lsp.config." .. server)
        if require_ok then
            Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
        end

        lspconfig[server].setup(Opts)
    end

    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = "" }
        )
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
            suffix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
end

return M
