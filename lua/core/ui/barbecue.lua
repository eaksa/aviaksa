local M = {
    -- 28 Apr 2023
    "utilyre/barbecue.nvim",
    commit = "cd7e7da622d68136e13721865b4d919efd6325ed",
    event = { "VimEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
    dependencies = {
        {
            -- 21 Jul 2023
            "SmiteshP/nvim-navic",
            commit = "9c89730da6a05acfeb6a197e212dfadf5aa60ca0",
        },
        {
            -- 16 Jul 2023
            "nvim-tree/nvim-web-devicons",
            commit = "efbfed0567ef4bfac3ce630524a0f6c8451c5534",
        },
    },
}

function M.config()
    local status_ok, barbecue = pcall(require, "barbecue")
    if not status_ok then
        return
    end

    barbecue.setup({
        ---Whether to attach navic to language servers automatically.
        ---
        ---@type boolean
        attach_navic = true,

        ---Whether to create winbar updater autocmd.
        ---
        ---@type boolean
        create_autocmd = true,

        ---Buftypes to enable winbar in.
        ---
        ---@type string[]
        include_buftypes = { "" },

        ---Filetypes not to enable winbar in.
        ---
        ---@type string[]
        exclude_filetypes = { "netrw", "toggleterm" },

        modifiers = {
            ---Filename modifiers applied to dirname.
            ---
            ---See: `:help filename-modifiers`
            ---
            ---@type string
            dirname = ":~:.",

            ---Filename modifiers applied to basename.
            ---
            ---See: `:help filename-modifiers`
            ---
            ---@type string
            basename = "",
        },

        ---Whether to display path to file.
        ---
        ---@type boolean
        show_dirname = false,

        ---Whether to display file name.
        ---
        ---@type boolean
        show_basename = true,

        ---Whether to replace file icon with the modified symbol when buffer is
        ---modified.
        ---
        ---@type boolean
        show_modified = false,

        ---Get modified status of file.
        ---
        ---NOTE: This can be used to get file modified status from SCM (e.g. git)
        ---
        ---@type fun(bufnr: number): boolean
        modified = function(bufnr)
            return vim.bo[bufnr].modified
        end,

        ---Whether to show/use navic in the winbar.
        ---
        ---@type boolean
        show_navic = true,

        ---Get leading custom section contents.
        ---
        ---NOTE: This function shouldn't do any expensive actions as it is run on each
        ---render.
        ---
        ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
        lead_custom_section = function()
            local config = require("barbecue.config")
            local path = "    "

            config.user.show_dirname = true
            local dirs = require("barbecue.ui.components").dirname(0)
            config.user.show_dirname = false

            for _, dir in pairs(dirs) do
                path = path .. dir.text[1] .. " / "
            end
            return path
        end,

        ---@alias barbecue.Config.custom_section
        ---|string # Literal string.
        ---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
        ---
        ---Get custom section contents.
        ---
        ---NOTE: This function shouldn't do any expensive actions as it is run on each
        ---render.
        ---
        ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
        custom_section = function()
            return " "
        end,

        ---Whether context text should follow its icon's color.
        ---
        ---@type boolean
        context_follow_icon_color = false,

        symbols = {
            ---Modification indicator.
            ---
            ---@type string
            modified = "●",

            ---Truncation indicator.
            ---
            ---@type string
            ellipsis = "…",

            ---Entry separator.
            ---
            ---@type string
            separator = "▸",
        },

        ---@alias barbecue.Config.kinds
        ---|false # Disable kind icons.
        ---|table<string, string> # Type to icon mapping.
        ---
        ---Icons for different context entry kinds.
        ---
        ---@type barbecue.Config.kinds
        kinds = {
            File = "",
            Module = "",
            Namespace = "",
            Package = "",
            Class = "",
            Method = "",
            Property = "",
            Field = "",
            Constructor = "",
            Enum = "",
            Interface = "",
            Function = "󰊕",
            Variable = "",
            Constant = "",
            String = "",
            Number = "",
            Boolean = "",
            Array = "",
            Object = "",
            Key = "",
            Null = "",
            EnumMember = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        },

        theme = {
            basename = { link = "Normal" },
            separator = { link = "Identifier" },
            context = { link = "Normal" },
        },
    })
end

return M
