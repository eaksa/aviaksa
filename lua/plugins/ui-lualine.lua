local M = {
    "nvim-lualine/lualine.nvim",
	-- 15 May 2025
	commit = "15884cee63a8c205334ab13ab1c891cd4d27101a",
    event = {
        "VimEnter",
        "InsertEnter",
        "BufReadPre",
        "BufAdd",
        "BufNew",
        "BufReadPost",
    },
}

function M.config()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
        return
    end
    local hl = require("utils.hl")

    local bar_is_wide = function()
        return vim.fn.winwidth(0) > 80
    end

    local is_insert_mode = function()
        return vim.api.nvim_get_mode()["mode"] == "i"
    end

    local get_lsp_client = function()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 }) or { {} }
        for _, client in ipairs(clients) do
            if client.name and client.name ~= "null-ls" then
                return client.name
            end
        end
        return nil
    end

    local file = {
        {
            "filename",
            file_status = true,
            path = 0,
            shorting_target = 40,
            symbols = {
                modified = " ",
                readonly = " 󰏯",
                unnamed = "",
            },
        },
        {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = function()
                return bar_is_wide() and not is_insert_mode()
            end,
        },
        {
            "diff",
            colored = false,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = function()
                return bar_is_wide() and is_insert_mode()
            end,
        },
    }

    local diagnostics = {
        {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = true,
            always_visible = false,
            update_in_insert = true,
            cond = function()
                return not is_insert_mode()
            end,
        },
        {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            colored = false,
            always_visible = false,
            update_in_insert = true,
            cond = function()
                return is_insert_mode()
            end,
        },
    }

    local lsp = {
        {
            "filetype",
            colored = true,
            icon_only = true,
            separator = { left = " ", right = " " },
            left_padding = 1,
            cond = function()
                return get_lsp_client() and not is_insert_mode()
            end,
        },
        {
            "filetype",
            colored = false,
            icon_only = true,
            separator = { left = " ", right = " " },
            left_padding = 1,
            cond = function()
                return get_lsp_client() and is_insert_mode()
            end,
        },
        {
            function()
                return ""
            end,
            separator = { left = " ", right = " " },
            left_padding = 1,
            cond = function()
                return not get_lsp_client()
            end,
        },
        {
            function()
                return get_lsp_client() or "No LSP"
            end,
            separator = { left = " ", right = " " },
            left_padding = 1,
            cond = function()
                return bar_is_wide()
            end,
        },
    }

    local colours = {
        white = hl.gui_fg("Normal"),
        light = hl.gui_bg("CursorLine"),
		black = hl.gui_bg("StatusLine"),
        statusline = hl.gui_bg("StatusLineNC"),

		normal = hl.gui_bg("TabLineSel"),
        insert = hl.gui_bg("TabLineSel"),
		visual = hl.gui_fg("Statement"),
		replace = hl.gui_bg("Substitute"),
		command = hl.gui_fg("Debug"),
    }

    local hide_lualine = function()
        return {
            a = { fg = hl.gui_fg("EndOfBuffer") },
            b = { fg = hl.gui_fg("EndOfBuffer") },
            c = { fg = hl.gui_fg("EndOfBuffer") },
        }
    end

    local theme_mode = function(colour)
        return {
            a = { bg = colour, fg = hl.darken(colour, 0.7), gui = "bold" },
            b = { bg = hl.darken(colour, 0.7), fg = colours.white },
            c = { bg = colours.statusline, fg = colours.white },
        }
    end

    local theme = {
        normal = theme_mode(colours.normal),
        insert = {
            a = {
                bg = colours.white,
                fg = hl.darken(colours.insert, 0.7),
                gui = "bold",
            },
            b = { bg = colours.insert, fg = hl.darken(colours.insert, 0.7) },
            c = { bg = hl.darken(colours.insert, 0.6), fg = colours.white },
        },
        visual = theme_mode(colours.visual),
        command = theme_mode(colours.command),
        replace = theme_mode(colours.replace),
        terminal = hide_lualine(),
        inactive = hide_lualine(),
    }

    -- Make status line float
    vim.api.nvim_set_hl(0, "StatusLine", { fg = hl.gui_fg("StatusLine") })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = hl.gui_fg("StatusLineNC") })

    lualine.setup({
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = theme,
            component_separators = { left = " ", right = " " },
            section_separators = { left = " ", right = " " },
            disabled_filetypes = { "alpha", "dashboard", "NvimTree" },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    separator = { left = "  ", right = " " },
                    right_padding = 1,
                },
            },
            lualine_b = { "branch" },
            lualine_c = file,
            lualine_x = diagnostics,
            lualine_y = lsp,
            lualine_z = {},
        },
        inactive_sessions = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
    })
end

return M
