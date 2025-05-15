local M = {
    "folke/tokyonight.nvim",
	version = "^4.11.0",
    lazy = false,
    priority = 1000,
    default_style = "moon",
}

function M.config()
    local tokyonight = require("tokyonight")

    tokyonight.setup({
        style = M.default_style,
        transparent = true,
        terminal_colors = true,
        styles = {
            comments = { italic = true, bold = false },
            keywords = { italic = true },
            functions = {},
            variables = {},
            sidebars = "dark",
            floats = "dark",
        },
        sidebars = { "qf", "help", "terminal" },
        -- day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,

        ---@param colors ColorScheme
        on_colors = function(colors) end,

        -- on_highlights = function(hl, c)
        --     -- Treesitter node types
        --     hl.Statement.style = { italic = true }
        --     hl.PreProc.style = { italic = true }
        --     hl.Type.style = {}
        --     hl.Special.style = { italic = true }
        --
        --     -- Cursor line number
        --     hl.CursorLineNr.style = { bold = true }
        --
        --     -- NvimTree icons
        --     hl.NvimTreeFolderIcon = { fg = c.magenta }
        --     hl.NvimTreeGitDirty = { fg = c.yellow }
        -- end,
    })

    local status_ok, _ =
        pcall(vim.cmd.colorscheme, "tokyonight-" .. M.default_style)
    if not status_ok then
        return
    end
end

return M
