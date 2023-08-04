local M = {
    -- 27 Jul 2023
    "brenoprata10/nvim-highlight-colors",
    commit = "231547093a788b925b8fc36351ad422701c3a8c8",
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
}

function M.config()
    local highlight_colors = require("nvim-highlight-colors")
    highlight_colors.setup({
        enable_named_colors = false,
    })
    highlight_colors.turnOn()
end

return M
