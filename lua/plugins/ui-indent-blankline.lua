local M = {
    "lukas-reineke/indent-blankline.nvim",
	version = "^2.20.8",
    event = "BufReadPre",
}

M.opts = {
    char = "∙",
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
    },
}

return M
