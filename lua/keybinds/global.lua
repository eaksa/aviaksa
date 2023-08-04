local M = {

    -- BASIC KEYBINDINGS --
    normal = {
        -- Navigate windows
        ["<C-h>"] = { "<C-w>h" },
        ["<C-j>"] = { "<C-w>j" },
        ["<C-k>"] = { "<C-w>k" },
        ["<C-l>"] = { "<C-w>l" },

        -- Navigate buffers
        ["<S-l>"] = { "<CMD>lua require('utils.buffer').next_buffer)<CR>" },
        ["<S-h>"] = { "<CMD>lua require('utils.buffer').prev_buffer)<CR>" },
        ["<C-p>"] = { "<CMD>BufferPin<CR>" },

        -- Resize windows
        ["<S-Up>"] = { "<CMD>resize -2<CR>" },
        ["<S-Down>"] = { "<CMD>resize +2<CR>" },
        ["<S-Left>"] = { "<CMD>vertical resize -2<CR>" },
        ["<S-Right>"] = { "<CMD>vertical resize +2<CR>" },

        -- Telescope
        ["gf"] = {
            "<CMD>lua require('utils.buffer').eval_unmodified('Telescope find_files')<CR>",
            "List files",
        },
        ["gt"] = {
            "<CMD>lua require('utils.buffer').eval_unmodified('Telescope live_grep')<CR>",
            "Search project tree",
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
        ["g1"] = { "<CMD>lua require('utils.buffer').goto_buffer(1)<CR>" },
        ["g2"] = { "<CMD>lua require('utils.buffer').goto_buffer(2)<CR>" },
        ["g3"] = { "<CMD>lua require('utils.buffer').goto_buffer(3)<CR>" },
        ["g4"] = { "<CMD>lua require('utils.buffer').goto_buffer(4)<CR>" },
        ["g5"] = { "<CMD>lua require('utils.buffer').goto_buffer(5)<CR>" },
        ["g6"] = { "<CMD>lua require('utils.buffer').goto_buffer(6)<CR>" },
        ["g7"] = { "<CMD>lua require('utils.buffer').goto_buffer(7)<CR>" },
        ["g8"] = { "<CMD>lua require('utils.buffer').goto_buffer(8)<CR>" },
        ["g9"] = { "<CMD>lua require('utils.buffer').goto_buffer(9)<CR>" },

        -- Always centre search results
        ["n"] = { "nzz" },
        ["N"] = { "Nzz" },

        -- Close buffers
        ["ZZ"] = { "<CMD>lua require('utils.buffer').close_focused()<CR>" },
    },

    insert = {
        -- Quit insert mode
        ["jj"] = { "<ESC>" },
        ["jk"] = { "<ESC>" },
    },

    visual = {
        -- Increase/decrease indentation
        ["<"] = { "<gv" },
        [">"] = { ">gv" },

        -- Paste in visual mode
        ["p"] = { "_dP" },
    },

    visual_block = {},
    term = {},
    command = {},
}

-- EXTENDED KEYBINDINGS --
M.normal["<leader>"] = {
    keygroup = {

        ["f"] = {
            "Find",
            keygroup = {
                ["f"] = { "gf", "List files" },
                ["p"] = { "gp", "List buffers" },
                ["t"] = { "gt", "Search project tree" },
                ["D"] = { "gD", "List projects" },
                ["c"] = { "<CMD>Telescope commands<CR>", "List commands" },
                ["n"] = { "<CMD>Telescope notify<CR>", "List notifications" },
                ["/"] = { "g/", "Search in buffer" },
            },
        },

        ["o"] = {
            "Open",
            keygroup = {
                ["g"] = {
                    "<CMD>lua require('utils.terminals').toggle_lazygit()<CR>",
                    "Open Lazygit",
                },
                -- ["s"] = { "<CMD>lua require('utils.terminals').toggle_spotify()<CR>", "Open Spotify" },
            },
        },

        ["p"] = { "<CMD>BufferPin<CR>", "Pin buffer" },
        ["e"] = { "<CMD>NvimTreeToggle<CR>", "Toggle NvimTree" },
        ["h"] = { "<CMD>nohlsearch<CR>", "Clear highlights" },
    },
}

M.visual_block["<leader>"] = {
    keygroup = {
        ["/"] = {
            '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',
            "Comment/uncomment line",
        },
    },
}

return M
