local M = {
    "nvim-treesitter/nvim-treesitter-context",
	-- 15 May 2025
	commit = "5c48b8ba1b0b7b25feb6e34e7eb293ea893aedc4",
    event = "VeryLazy",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter",
        },
    },
}

function M.config()
    local treesitter_context = require("treesitter-context")

    -- Make context window transparent
    vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = nil })

    treesitter_context.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 30, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 1, -- Maximum number of lines to collapse for a single context line
        trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = "┄",
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })
end

return M
