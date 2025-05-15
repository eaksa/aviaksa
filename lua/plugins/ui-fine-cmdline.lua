local M = {
    "VonHeikemen/fine-cmdline.nvim",
	-- 15 May 2025
	commit = "aec9efebf6f4606a5204d49ffa3ce2eeb7e08a3e",
    event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
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
