-- Set relative line numbering except in insert mode
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" },
    {
        pattern = "*",
        callback = function()
            if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
                vim.opt.relativenumber = true
            end
        end,
    }
)

-- Set absolute line numbering in insert mode
vim.api.nvim_create_autocmd(
    { "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" },
    {
        pattern = "*",
        callback = function()
            if vim.o.nu then
                vim.opt.relativenumber = false
                vim.cmd("redraw")
            end
        end,
    }
)
