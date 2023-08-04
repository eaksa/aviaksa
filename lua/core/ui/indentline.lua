local M = {
    -- 07 Jul 2023
    "lukas-reineke/indent-blankline.nvim",
    commit = "4541d690816cb99a7fc248f1486aa87f3abce91c",
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
