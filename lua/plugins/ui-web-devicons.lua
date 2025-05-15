local M = {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
	-- 15 May 2025
	commit = "f1420728f59843eb2ef084406b3d0201a0a0932d",
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
