local M = {
    -- 14 Jul 2023
    "windwp/nvim-autopairs",
    commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e",
    event = "InsertEnter",
    dependencies = {
        {
            -- 30 Jun 2023
            "hrsh7th/nvim-cmp",
            commit = "2743dd989e9b932e1b4813a4927d7b84272a14e2",
            event = {
                "InsertEnter",
                "CmdlineEnter",
            },
        },
    },
}

function M.config()
    require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt" },
        ts_config = {
            lua = { "string", "source" },
            javascript = { "string", "template_string" },
            java = false,
        },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = 0,
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "PmenuSel",
            highlight_grey = "LineNr",
        },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
end

return M
