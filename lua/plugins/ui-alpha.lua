local M = {
    "goolord/alpha-nvim",
    event = "VimEnter",
	-- 15 May 2025
	commit = "de72250e054e5e691b9736ee30db72c65d560771",
}

function M.config()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
        [[  ░▒░   ██   ██ ██████   ░▒░   ▒▒   ▒▒ ░▒▒▒▒▒░   ░▒░  ]],
        [[ ░▒ ▒░  ██   ██   ██    ░▒ ▒░  ▒▒  ░▒▒ ▒▒       ░▒ ▒░ ]],
        [[░▒░ ░▒░  ██ ██    ██   ░▒░ ░▒░ ▒▒ ░▒▒  ░▒▒▒▒░  ░▒░ ░▒░]],
        [[░▒▒▒▒▒░  ██ ██    ██   ░▒▒▒▒▒░ ▒▒▒▒▒░      ░▒▒ ░▒▒▒▒▒░]],
        [[▒▒   ▒▒   ███   ██████ ▒▒   ▒▒ ▒▒  ░▒▒ ▒▒▒▒▒▒░ ▒▒   ▒▒]],
    }
    dashboard.section.buttons.val = {
        dashboard.button(
            "/",
            "󰥨 " .. " Search",
            ":lua require('telescope.builtin').live_grep()<CR>"
        ),
        dashboard.button(
            "p",
            "󰥨 " .. " Find project",
            ":lua require('telescope').extensions.projects.projects()<CR>"
        ),
        dashboard.button(
            "f",
            "󰱼 " .. " Find file",
            ":Telescope find_files <CR>"
        ),
        dashboard.button(
            "t",
            " " .. " Open terminal",
            ":lua require('toggleterm.terminal').Terminal:new {}:toggle()<CR>"
        ),
        dashboard.button(
            "e",
            " " .. " New file",
            ":ene <BAR> startinsert <CR>"
        ),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    local function footer()
        return "Elang Adhyaksa 2022-2025"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
end

return M
