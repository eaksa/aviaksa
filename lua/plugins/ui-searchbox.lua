local M = {
    "VonHeikemen/searchbox.nvim",
	-- 15 May 2025
	commit = "ed230583c78795526b3d4585ac1460c108e26213",
    event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
		}
	}
}

function M.config()
    local status_ok, searchbox = pcall(require, "searchbox")
    if not status_ok then
        return
    end

    searchbox.setup({
		defaults = {
			reverse = false,
			exact = false,
			prompt = ' ',
			modifier = 'disabled',
			confirm = 'off',
			clear_matches = true,
			show_matches = true,
		},
		popup = {
			relative = 'win',
			position = {
				row = '33%',
				col = '50%',
			},
			size = '60%',
			border = {
				style = { "█" },
				text = {
					top = ' Search ',
					top_align = 'left',
				},
			},
			win_options = {
				winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
			},
		},
		hooks = {
			before_mount = function(input)
			-- code
			end,
			after_mount = function(input)
			-- code
			end,
			on_done = function(value, search_type)
			-- code
			end
		}
	})
end
return M
