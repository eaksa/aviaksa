local M = {
    "nvim-telescope/telescope.nvim",
	version = "^0.1.8",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
        {
            "ahmedkhalf/project.nvim",
        },
        {
            "BurntSushi/ripgrep",
        },
        {
            "sharkdp/fd",
        },
    },
}

local actions = require("telescope.actions")

M.opts = {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules", "target" },
        mappings = {
            n = {
                ["ZZ"] = actions.close,
                ["<C-t>"] = actions.close,
                ["l"] = actions.select_default,
            },
            i = {
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-t>"] = actions.close,
                ["<esc>"] = actions.close,
            },
        },
    },
}

return M
