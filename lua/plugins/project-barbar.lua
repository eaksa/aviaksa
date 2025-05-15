local M = {
    "romgrk/barbar.nvim",
	version = "^1.9.1",
    event = { "VimEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
        },
    },
}

function M.config()
    local status_ok, barbar = pcall(require, "barbar")
    if not status_ok then
        return
    end
    local hl = require("utils.hl")

    -- Make tabline invisible
    vim.api.nvim_set_hl(
		0,
		"BufferTabpages",
		{ bg = hl.gui_fg("EndOfBuffer") }
	)
    vim.api.nvim_set_hl(
		0,
		"BufferTabpageFill",
		{ bg = hl.gui_fg("EndOfBuffer") }
	)
    vim.api.nvim_set_hl(
		0,
		"BufferOffset",
		{ bg = hl.gui_fg("EndOfBuffer") }
	)

    -- Bubble style
    vim.api.nvim_set_hl(
        0,
        "BufferCurrentSign",
        { fg = hl.gui_bg("BufferCurrent") }
    )
    vim.api.nvim_set_hl(
        0,
        "BufferInactiveSign",
        { fg = hl.gui_bg("BufferInactive") }
    )
    vim.api.nvim_set_hl(
        0,
        "BufferVisibleSign",
        { fg = hl.gui_bg("BufferVisible") }
    )
    vim.api.nvim_set_hl(
        0,
        "BufferAlternateSign",
        { fg = hl.gui_bg("BufferAlternate") }
    )

    -- Differentiate modified filenames from warning signs
    vim.api.nvim_set_hl(0, "BufferCurrentMod", { link = "BufferCurrent" })
    vim.api.nvim_set_hl(0, "BufferInactiveMod", { link = "BufferInactive" })
    vim.api.nvim_set_hl(0, "BufferVisibleMod", { link = "BufferVisible" })
    vim.api.nvim_set_hl(0, "BufferAlternateMod", { link = "BufferAlternate" })

    vim.api.nvim_set_hl(0, "BufferScrollArrow", { link = "FoldColumn" })

    barbar.setup({
        -- Enable/disable animations
        animation = true,

        -- Enable/disable auto-hiding the tab bar when there is a single buffer
        auto_hide = false,

        -- Enable/disable current/total tabpages indicator (top right corner)
        tabpages = false,

        -- Enables/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = true,

        -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
        -- Valid options are 'left' (the default), 'previous', and 'right'
        focus_on_close = "left",

        -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
        hide = {
            inactive = false,
            extensions = false,
            alternate = true,
            current = false,
            visible = false,
        },

        -- Disable highlighting alternate buffers
        highlight_alternate = false,

        -- Disable highlighting file icons in inactive buffers
        highlight_inactive_file_icons = true,

        -- Enable highlighting visible buffers
        highlight_visible = true,

        icons = {
            buffer_index = false,
            buffer_number = false,
            filename = false,
            button = "",
            filetype = { enabled = false },
            separator = { left = "", right = "" },
            -- button = '×',
            -- diagnostics = {
            --   [vim.diagnostic.severity.ERROR] = {enabled = true, icon = " "},
            --   [vim.diagnostic.severity.WARN] = {enabled = true, icon = " "},
            --   [vim.diagnostic.severity.INFO] = {enabled = false},
            --   [vim.diagnostic.severity.HINT] = {enabled = false},
            -- },
            -- filetype = {
            --   -- Sets the icon's highlight group.
            --   -- If false, will use nvim-web-devicons colors
            --   custom_colors = false,
            --   enabled = true,
            -- },
            -- separator = { left = " ", right = " " },
            separator_at_end = false,
            scroll = { left = "▕", right = "▏" },
            inactive = { separator = { left = "", right = "" } },
            modified = { button = "" },
            pinned = {
                button = "  ×",
                buffer_index = true,
                filename = true,
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {
                        enabled = true,
                        icon = " ",
                    },
                    [vim.diagnostic.severity.WARN] = {
                        enabled = true,
                        icon = " ",
                    },
                    [vim.diagnostic.severity.INFO] = { enabled = false },
                    [vim.diagnostic.severity.HINT] = { enabled = false },
                },
                filetype = {
                    -- Sets the icon's highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = false,
                    enabled = false,
                },
                separator = { left = " ██", right = " " },
            },
        },

        -- Sets the maximum padding width with which to surround each tab
        maximum_padding = 0,

        -- Sets the minimum padding width with which to surround each tab
        minimum_padding = 0,

        -- Sets the maximum buffer name length.
        maximum_length = 30,

        -- Sets the minimum buffer name length.
        minimum_length = 0,

        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = nil}
            NvimTree = true,
            -- Or, specify the text used for the offset:
            --undotree = {text = 'undotree'},
            -- Or, specify the event which the sidebar executes when leaving:
            --['neo-tree'] = {event = 'BufWipeout'},
            -- Or, specify both
            --Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
        },

        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        -- where X is the buffer number. But only a static string is accepted here.
        no_name_title = nil,
    })
end

return M
