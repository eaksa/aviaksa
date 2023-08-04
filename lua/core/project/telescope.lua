local M = {
    -- 01 Aug 2023
    "nvim-telescope/telescope.nvim",
    commit = "d2e17ba18a6840b7e7079764b282616c3188e0de",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
        {
            -- 04 Apr 2023
            "ahmedkhalf/project.nvim",
            commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
        },
        {
            -- 31 Jul 2023
            "BurntSushi/ripgrep",
            commit = "341a19e0d05bc6f0cabeb2dc756b37cfc047f8f0",
        },
        {
            -- 02 Aug 2023
            "sharkdp/fd",
            commit = "9ce43b2d7b1ae80c53e8801d2ce4c0499e88d78f",
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
