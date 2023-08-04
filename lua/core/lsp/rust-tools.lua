local M = {
    -- 11 Jul 2023
    "simrat39/rust-tools.nvim",
    commit = "0cc8adab23117783a0292a0c8a2fbed1005dc645",
    event = "VeryLazy",
    dependencies = {
        {
            -- 23 Jun 2023
            "hrsh7th/cmp-nvim-lsp",
            commit = "44b16d11215dce86f253ce0c30949813c0a90765",
        },
    },
}

function M.config()
    local status_ok, rust_tools = pcall(require, "rust-tools")
    if not status_ok then
        return
    end
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

    local function lsp_keymaps(bufnr)
        local keymaps = require("builtin.keymap.lsp")
        local map = require("builtin.keymap.utils")
        for mode, keymap in pairs(keymaps) do
            map.mode_set(mode, keymap, bufnr)
        end
    end

    local on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        require("illuminate").on_attach(client)
    end

    local settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
                experimental = { enable = true },
            },
        },
    }

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

    rust_tools.setup({
        tools = {
            -- how to execute terminal commands
            -- options right now: termopen / quickfix / toggleterm / vimux
            executor = require("rust-tools.executors").termopen,

            -- callback to execute once rust-analyzer is done initializing the workspace
            -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
            on_initialized = nil,

            -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
            reload_workspace_from_cargo_toml = true,

            -- These apply to the default RustSetInlayHints command
            inlay_hints = {
                -- automatically set inlay hints (type hints)
                -- default: true
                auto = true,

                -- Only show inlay hints for the current line
                only_current_line = true,

                -- whether to show parameter hints with the inlay hints or not
                -- default: true
                show_parameter_hints = true,

                -- prefix for parameter hints
                -- default: "<-"
                parameter_hints_prefix = "  <- ",

                -- prefix for all the other hints (type, chaining)
                -- default: "=>"
                other_hints_prefix = "    ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "NormalNC",
            },

            -- options same as lsp hover / vim.lsp.util.open_floating_preview()
            hover_actions = {

                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },

                -- Maximal width of the hover window. Nil means no max.
                max_width = nil,

                -- Maximal height of the hover window. Nil means no max.
                max_height = nil,

                -- whether the hover action window gets automatically focused
                -- default: false
                auto_focus = false,
            },

            -- settings for showing the crate graph based on graphviz and the dot
            -- command
            crate_graph = {
                -- Backend used for displaying the graph
                -- see: https://graphviz.org/docs/outputs/
                -- default: x11
                backend = "x11",
                -- where to store the output, nil for no output stored (relative
                -- path from pwd)
                -- default: nil
                output = nil,
                -- true for all crates.io and external crates, false only the local
                -- crates
                -- default: true
                full = true,

                -- List of backends found on: https://graphviz.org/docs/outputs/
                -- Is used for input validation and autocompletion
                -- Last updated: 2021-08-26
                enabled_graphviz_backends = {
                    "bmp",
                    "cgimage",
                    "canon",
                    "dot",
                    "gv",
                    "xdot",
                    "xdot1.2",
                    "xdot1.4",
                    "eps",
                    "exr",
                    "fig",
                    "gd",
                    "gd2",
                    "gif",
                    "gtk",
                    "ico",
                    "cmap",
                    "ismap",
                    "imap",
                    "cmapx",
                    "imap_np",
                    "cmapx_np",
                    "jpg",
                    "jpeg",
                    "jpe",
                    "jp2",
                    "json",
                    "json0",
                    "dot_json",
                    "xdot_json",
                    "pdf",
                    "pic",
                    "pct",
                    "pict",
                    "plain",
                    "plain-ext",
                    "png",
                    "pov",
                    "ps",
                    "ps2",
                    "psd",
                    "sgi",
                    "svg",
                    "svgz",
                    "tga",
                    "tiff",
                    "tif",
                    "tk",
                    "vml",
                    "vmlz",
                    "wbmp",
                    "webp",
                    "xlib",
                    "x11",
                },
            },
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
            -- standalone file support
            -- setting it to false may improve startup time
            standalone = true,
            on_attach = on_attach,
            capabilities = capabilities,
            settings = settings,
        }, -- rust-analyzer options

        -- debugging stuff
        dap = {
            adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
            },
        },
    })
end

return M
