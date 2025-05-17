local M = {
    "folke/zen-mode.nvim",
	-- 15 May 2025
	commit = "863f150ca321b3dd8aa1a2b69b5f411a220e144f",
    event = "VeryLazy",
    opts = {
        window = {
            backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            -- height and width can be:
            -- * an absolute number of cells when > 1
            -- * a percentage of the width / height of the editor when <= 1
            -- * a function that returns the width or the height
            width = 130, -- width of the Zen window
            height = 1, -- height of the Zen window
            -- by default, no options are changed for the Zen window
            -- uncomment any of the options below, or add other vim.wo options you want to apply
            options = {
                -- signcolumn = "no", -- disable signcolumn
                -- number = false, -- disable number column
                -- relativenumber = false, -- disable relative numbers
                -- cursorline = false, -- disable cursorline
                -- cursorcolumn = false, -- disable cursor column
                -- foldcolumn = "0", -- disable fold column
                -- list = false, -- disable whitespace characters
            },
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
                enabled = true,
                ruler = false, -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
            },
            twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
            gitsigns = { enabled = true }, -- disables git signs
            tmux = { enabled = false }, -- disables the tmux statusline
            -- this will change the font size on wezterm when in zen mode
            -- See alse also the Plugins/Wezterm section in this projects README
            wezterm = {
                enabled = true,
                -- can be either an absolute font size or the number of incremental steps
                font = "+1", -- (10% increase per step)
            },
        },
        -- callback where you can add custom code when the Zen window opens
        on_open = function(win)
            require("barbecue.ui").toggle(false)
            -- _ORIGINAL_WINDOW_IS_FULL_SCREEN = _TERM_WINDOW_IS_FULL_SCREEN()
            -- _ENTER_FULL_SCREEN()
        end,
        -- callback where you can add custom code when the Zen window closes
        on_close = function()
            require("barbecue.ui").toggle(true)
			require("lualine").hide({ unhide = true })
            -- if not _ORIGINAL_WINDOW_IS_FULL_SCREEN then
            --     _EXIT_FULL_SCREEN()
            -- end
        end,
    },
}

function _TOGGLE_ZEN_MODE()
    -- Do not enter Zen Mode in NvimTree buffer
    local is_nvim_tree = require("nvim-tree.api").tree.is_tree_buf(0)
    if is_nvim_tree then
        return
    end
	require("lualine").hide({ unhide = false })
    require("zen-mode").toggle()
end

return M
