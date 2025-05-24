local M = {
	"folke/noice.nvim",
	version = "^4.10.0",
    event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

function M.config()
	local status_ok, noice = pcall(require, "noice")
	if not status_ok then
		return
	end
	noice.setup({
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		cmdline = {
			format = {
				cmdline = { icon = ":" },
				search_down = { icon = "" },
				search_up = { icon = " " },
			}
		},
		views = {
			cmdline_popup = {
				position = {
					row = 12,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				win_options = {
					winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 15,
					col = "50%",
				},
				size = {
					width = 60,
					height = "50%",
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
	})
end

return M
