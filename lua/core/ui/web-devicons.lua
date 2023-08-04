local M = {
    -- 16 Jul 2023
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    commit = "efbfed0567ef4bfac3ce630524a0f6c8451c5534",
}

function M.config()
    require("nvim-web-devicons").setup({
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh",
            },
        },
        color_icons = true,
        default = true,
    })
end

return M
