local M = {
    -- 27 Jul 2023
    -- WARN: Plugin now archived
    "ethanholz/nvim-lastplace",
    commit = "0bb6103c506315044872e0f84b1f736c4172bb20",
    event = "VimEnter",
}

function M.config()
    require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
            "gitcommit",
            "gitrebase",
            "svn",
            "hgcommit",
        },
        lastplace_open_folds = true,
    })
end

return M
