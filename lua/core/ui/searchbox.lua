local M = {
    -- 30 Dec 2023
    "VonHeikemen/searchbox.nvim",
    commit = "110949af8963185b4e732b45ae57beb731bfcede",
    event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
			commit = "80445d015d2b5f9af0d9e8bce63d303bc86eda8a",
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
