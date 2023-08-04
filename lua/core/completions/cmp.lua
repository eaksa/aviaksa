local M = {
    -- 30 Jun 2023
    "hrsh7th/nvim-cmp",
    commit = "2743dd989e9b932e1b4813a4927d7b84272a14e2",
    dependencies = {
        {
            -- 23 Jun 2023
            "hrsh7th/cmp-nvim-lsp",
            commit = "44b16d11215dce86f253ce0c30949813c0a90765",
        },
        {
            -- 10 Aug 2022
            "hrsh7th/cmp-buffer",
            commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
        },
        {
            -- 03 Oct 2022
            "hrsh7th/cmp-path",
            commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
        },
        {
            -- 08 Jun 2023
            "hrsh7th/cmp-cmdline",
            commit = "8ee981b4a91f536f52add291594e89fb6645e451",
        },
        {
            -- 28 Oct 2022
            "saadparwaiz1/cmp_luasnip",
            commit = "18095520391186d634a0045dacaa346291096566",
        },
        {
            -- 26 Jul 2023
            "L3MON4D3/LuaSnip",
            commit = "e81cbe6004051c390721d8570a4a0541ceb0df10",
            event = "InsertEnter",
            dependencies = {
                -- 24 Jul 2023
                "rafamadriz/friendly-snippets",
                commit = "bc38057e513458cb2486b6cd82d365fa294ee398",
            },
        },
        {
            -- 14 Apr 2023
            "hrsh7th/cmp-nvim-lua",
            commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
        },
    },
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
}

function M.config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip/loaders/from_vscode").lazy_load()

    local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    local kind_icons = {
        Text = "󰉿",
        Method = "m",
        Function = "󰊕",
        Constructor = "",
        Field = "",
        Variable = "󰆧",
        Class = "󰌗",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰇽",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰊄",
        Codeium = "󰚩",
        Copilot = "",
    }

    local formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            vim_item.kind = kind_icons[vim_item.kind] .. " "
            return vim_item
        end,
    }

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        }),
        formatting = formatting,
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
            side_padding = 0,
        },
        experimental = {
            ghost_text = true,
        },
    })
end

return M
