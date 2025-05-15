local M = {}

M.normal = {
    ["<leader>"] = {
		["l"] = {
			name = "Language server",
			["f"] = {
				"<CMD>lua vim.lsp.buf.formatting()<CR>",
				"Format buffer",
			},
			["i"] = { "<CMD>Mason<CR>", "Install language server…" },
			["I"] = { "<CMD>LspInfo<CR>", "Get language server info" },
			["r"] = {
				"<CMD>lua vim.lsp.buf.rename()<CR>",
				"Rename all references",
			},
		},

		["a"] = {
			"<CMD>lua vim.lsp.buf.code_action()<CR>",
			"Code actions…",
		},
    },

    ["g"] = {
		name = "Language server",
		["d"] = {
			"<CMD>lua require('utils.buffer').eval_unmodified('Telescope lsp_definitions')<CR>",
			"Go to definition",
		},
		["I"] = {
			"<CMD>lua require('utils.buffer').eval_unmodified('Telescope lsp_implementation')<CR>",
			"Go to implementation",
		},
		["r"] = {
			"<CMD>lua require('utils.buffer').eval_unmodified('Telescope lsp_references')<CR>",
			"Go to references",
		},
		["R"] = {
			"<CMD>lua vim.lsp.buf.rename()<CR>",
			"Rename all references",
		},
		["i"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Get info" },
		["l"] = {
			"<CMD>lua vim.diagnostic.open_float()<CR>",
			"Get diagnostics",
		},
		["]"] = {
			"<CMD>lua vim.diagnostic.goto_next({ buffer = 0 })<CR>",
			"Next diagnostics",
		},
		["["] = {
			"<CMD>lua vim.diagnostic.goto_prev({ buffer = 0 })<CR>",
			"Previous diagnostics",
		},
    },
}

return M
