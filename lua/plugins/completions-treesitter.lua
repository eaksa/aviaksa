local M = {
    -- 15 May 2025
    "nvim-treesitter/nvim-treesitter",
	commit = "066fd6505377e3fd4aa219e61ce94c2b8bdb0b79",
    event = "BufReadPost",
    dependencies = {
        -- {
        --     "JoosepAlviste/nvim-ts-context-commentstring",
        --     event = "VeryLazy",
        -- },
        {
            "nvim-tree/nvim-web-devicons",
            event = "VeryLazy",
        },
        {
            "nvim-treesitter/playground",
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
			"regex",
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
