local M = {

    -- BASIC KEYBINDINGS --
    normal = {
        -- Navigate windows
        ["<C-h>"] = { "<C-w>h", "Navigate left" },
        ["<C-j>"] = { "<C-w>j", "Navigate down" },
        ["<C-k>"] = { "<C-w>k", "Navigate up" },
        ["<C-l>"] = { "<C-w>l", "Navigate right" },

        -- Navigate buffers
        ["<S-l>"] = {
			"<CMD>lua require('utils.buffer').next_buffer()<CR>",
			"Go to next buffer"
		},
        ["<S-h>"] = {
			"<CMD>lua require('utils.buffer').prev_buffer()<CR>",
			"Go to previous buffer"
		},
        ["<C-p>"] = { "<CMD>BufferPin<CR>", "Pin buffer" },

        -- Resize windows
        ["<S-Up>"] = { "<CMD>vertical resize -2<CR>", "Resize window up" },
        ["<S-Down>"] = { "<CMD>vertical resize +2<CR>", "Resize window down" },
        ["<S-Left>"] = { "<CMD>resize -2<CR>", "Resize window left" },
        ["<S-Right>"] = { "<CMD>resize +2<CR>", "Resize window right" },

        -- Telescope
        ["gf"] = {
            "<CMD>lua require('utils.buffer').eval_unmodified('Telescope find_files')<CR>",
            "List files",
        },
        ["gt"] = {
            "<CMD>lua require('utils.buffer').eval_unmodified('Telescope grep_string')<CR>",
            "Grep string",
        },
        ["gD"] = {
            "<CMD>lua require('utils.buffer').eval_unmodified('Telescope projects')<CR>",
            "List projects",
        },
        ["g/"] = {
            "<CMD>Telescope current_buffer_fuzzy_find<CR>",
            "Search in buffer",
        },

        -- Buffer navigation
        ["<C-^>"] = { "ga", "Go to alternate buffer" },
        ["ga"] = {
            "<CMD>lua require('utils.buffer').alt_buffer()<CR>",
            "Go to alternate buffer",
        },
        ["gp"] = {
            "<CMD>lua require('utils.buffer').eval_unmodified('Telescope buffers')<CR>",
            "List buffers",
        },
        ["g1"] = { "<CMD>lua require('utils.buffer').goto_buffer(1)<CR>", "Go to buffer 1" },
        ["g2"] = { "<CMD>lua require('utils.buffer').goto_buffer(2)<CR>", "Go to buffer 2" },
        ["g3"] = { "<CMD>lua require('utils.buffer').goto_buffer(3)<CR>", "Go to buffer 3" },
        ["g4"] = { "<CMD>lua require('utils.buffer').goto_buffer(4)<CR>", "Go to buffer 4" },
        ["g5"] = { "<CMD>lua require('utils.buffer').goto_buffer(5)<CR>", "Go to buffer 5" },
        ["g6"] = { "<CMD>lua require('utils.buffer').goto_buffer(6)<CR>", "Go to buffer 6" },
        ["g7"] = { "<CMD>lua require('utils.buffer').goto_buffer(7)<CR>", "Go to buffer 7" },
        ["g8"] = { "<CMD>lua require('utils.buffer').goto_buffer(8)<CR>", "Go to buffer 8" },
        ["g9"] = { "<CMD>lua require('utils.buffer').goto_buffer(9)<CR>", "Go to buffer 9" },

        -- Always centre search results
        ["n"] = { "nzz", "Go to next result" },
        ["N"] = { "Nzz", "Go to previous result" },

        -- Close buffers
        ["ZZ"] = {
			"<CMD>lua require('utils.buffer').close_focused()<CR>",
			"Close current buffer"
		},

		-- Open search and command boxes
		[":"] = { "<CMD>FineCmdline<CR>", "Input editor command" },
		["/"] = {
			"<CMD>SearchBoxMatchAll prompt='/ '<CR>",
			"Search in buffer"
		},
		["?"] = {
			"<CMD>SearchBoxMatchAll prompt='? ' reverse=true<CR>",
			"Reverse search in buffer"
		},
    },

    insert = {
        -- Quit insert mode
        ["jj"] = { "<ESC>", "Quit insert mode" },
        ["jk"] = { "<ESC>", "Quit insert mode" },
    },

    visual = {
        -- Increase/decrease indentation
        ["<"] = { "<gv", "Decrease indentation" },
        [">"] = { ">gv", "Increase indentation" },

		-- Open search box
		["/"] = {
			"<CMD>SearchBoxMatchAll prompt='/ ' visual_mode=true<CR>",
			"Search in buffer"
		},
		["?"] = {
			"<CMD>SearchBoxMatchAll prompt='? ' reverse=true visual_mode=true<CR>",
			"Reverse search in buffer"
		},

        -- Paste in visual mode
        ["p"] = { "_dP", "Paste" },
    },

    visual_block = {},
    term = {},
    command = {},
}

-- EXTENDED KEYBINDINGS --
M.normal["<leader>"] = {
	["a"] = {
		name = "Avante",
		["d"] = { "<CMD>AvanteClear<CR>", "avante: clear"},
	},
	["f"] = {
		name = "Find",
		["f"] = { "gf", "List files" },
		["p"] = { "gp", "List buffers" },
		["t"] = { "gt", "Search project tree" },
		["D"] = { "gD", "List projects" },
		["c"] = { "<CMD>Telescope commands<CR>", "List commands" },
		["n"] = { "<CMD>Telescope notify<CR>", "List notifications" },
		["/"] = { "g/", "Search in buffer" },
	},

	["o"] = {
		name = "Open",
		["g"] = {
			"<CMD>lua require('utils.terminals').toggle_lazygit()<CR>",
			"Open Lazygit",
		},
		["z"] = {
			"<CMD>lua _TOGGLE_ZEN_MODE()<CR>",
			"Toggle zen mode",
		}
		-- ["s"] = { "<CMD>lua require('utils.terminals').toggle_spotify()<CR>", "Open Spotify" },
	},

	["p"] = { "<CMD>BufferPin<CR>", "Pin buffer" },
	["e"] = { "<CMD>NvimTreeToggle<CR>", "Toggle NvimTree" },
	["h"] = { "<CMD>nohlsearch<CR>", "Clear highlights" },
}

return M
