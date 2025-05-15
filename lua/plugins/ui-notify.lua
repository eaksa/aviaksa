local M = {
    "rcarriga/nvim-notify",
	version = "^3.15.0",
    event = "VimEnter",
}

function M.config()
    local status_ok, notify = pcall(require, "notify")
    if not status_ok then
        return
    end
    local hl = require("utils.hl")

    vim.notify = notify

    local guibg = hl.gui_bg("NormalFloat")
    local levels = {
        ERROR = { border = "#8a1f1f", normal = "#f70067" },
        WARN = { border = "#79491d", normal = "#f79000" },
        INFO = { border = "#4f6752", normal = "#a9ff68" },
        DEBUG = { border = "#8b8b8b", normal = "#8b8b8b" },
        TRACE = { border = "#4f3552", normal = "#d484ff" },
    }

    -- Set highlights
    for level, highlights in pairs(levels) do
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Body", {
            link = "NormalFloat",
        })
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Border", {
            fg = highlights.border,
            bg = guibg,
        })
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Icon", {
            fg = highlights.normal,
            bg = guibg,
        })
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Title", {
            fg = highlights.normal,
            bg = guibg,
        })
    end

    notify.setup({
        max_width = 65,
        stages = "slide",
        fps = 60,
    })
end

return M
