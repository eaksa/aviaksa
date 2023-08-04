local M = {
    -- 03 Aug 2023
    "nvim-treesitter/nvim-treesitter",
    commit = "1e5576fa0165a222529777731a3257343047f916",
    event = "BufReadPost",
    dependencies = {
        {
            -- 27 Jul 2023
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
            commit = "e9062e2dfb9854e6a927370f2d720de354c88524",
        },
        {
            -- 16 Jul 2023
            "nvim-tree/nvim-web-devicons",
            event = "VeryLazy",
            commit = "efbfed0567ef4bfac3ce630524a0f6c8451c5534",
        },
        {
            -- 15 Apr 2023
            "nvim-treesitter/playground",
            commit = "2b81a018a49f8e476341dfcb228b7b808baba68b",
        },
    },
}

function M.config()
    local _ = require("nvim-treesitter")
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
            "lua",
            "markdown",
            "markdown_inline",
            "bash",
            "python",
            "rust",
        }, -- put the language you want in this array
        -- ensure_installed = "all", -- one of "all" or a list of languages
        ignore_install = { "" }, -- List of parsers to ignore installing
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
            },
        },

        highlight = {
            enable = true, -- false will disable the whole extension
            disable = { "css" }, -- list of language that will be disabled
        },
        autopairs = {
            enable = true,
        },
        indent = { enable = true, disable = { "python", "css" } },

        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    })
end

return M
