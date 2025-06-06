local M = {
    "hrsh7th/nvim-cmp",
	version = "^0.0.2",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "hrsh7th/cmp-buffer",
        },
        {
            "hrsh7th/cmp-path",
        },
        {
            "hrsh7th/cmp-cmdline",
        },
        {
            "saadparwaiz1/cmp_luasnip",
        },
        {
            "L3MON4D3/LuaSnip",
            event = "InsertEnter",
            dependencies = {
                "rafamadriz/friendly-snippets",
            },
        },
        {
            "hrsh7th/cmp-nvim-lua",
        },
		{
			"zbirenbaum/copilot-cmp",
			dependencies = {
				"zbirenbaum/copilot.lua",
				event = "InsertEnter",
			}
		}
    },
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
}

function M.config()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
	local copilot = require("copilot")
	local copilot_cmp = require("copilot_cmp")
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
        Copilot = "",
    }

    local formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            vim_item.kind = kind_icons[vim_item.kind] .. " "
            return vim_item
        end,
    }

    copilot.setup({
		panel = {
			enabled = false,
			-- auto_refresh = false,
			-- keymap = {
			-- 	jump_prev = "[[",
			-- 	jump_next = "]]",
			-- 	accept = "<CR>",
			-- 	refresh = "gr",
			-- 	open = "<M-CR>"
			-- },
			-- layout = {
			-- 	position = "bottom", -- | top | left | right
			-- 	ratio = 0.4
			-- },
		},
		suggestion = {
			enabled = false,
			-- auto_trigger = false,
			-- debounce = 75,
			-- keymap = {
			-- 	accept = "<M-l>",
			-- 	accept_word = false,
			-- 	accept_line = false,
			-- 	next = "<M-]>",
			-- 	prev = "<M-[>",
			-- 	dismiss = "<C-]>",
			-- },
		},
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = 'node', -- Node.js version must be > 18.x
		server_opts_overrides = {},
	})

	copilot_cmp.setup()

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
			{ name = "copilot" },
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
