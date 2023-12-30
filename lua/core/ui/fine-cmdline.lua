local M = {
    -- 30 Dec 2023
    "VonHeikemen/fine-cmdline.nvim",
    commit = "dd676584145d62b30d7e8dbdd011796a8f0a065f",
    event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
			commit = "80445d015d2b5f9af0d9e8bce63d303bc86eda8a",
		}
	}
}

function M.config()
    local status_ok, fine_cmdline = pcall(require, "fine-cmdline")
    if not status_ok then
        return
    end

    fine_cmdline.setup({
		cmdline = {
			enable_keymaps = true,
			smart_history = true,
			prompt = ': '
		},
		popup = {
			position = {
				row = '30%',
				col = '50%',
			},
			size = {
				width = '60%',
			},
			border = {
				style = { "█" },
			},
			win_options = {
				winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
			},
		},
		hooks = {
			-- before_mount = function(input)
			-- -- code
			-- end,
			-- after_mount = function(input)
			-- -- code
			-- end,
			-- set_keymaps = function(imap, feedkeys)
			-- -- code
			-- end
		}
	})
	end

return M
