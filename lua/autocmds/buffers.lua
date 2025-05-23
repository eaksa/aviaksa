-- Use "ZZ" to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "qf",
        "help",
        "man",
        "lspinfo",
        "spectre_panel",
        "mason",
        "lazy",
    },
    callback = function()
        vim.cmd([[
		nnoremap <silent> <buffer> ZZ :close<CR>
		set nobuflisted
	]])
    end,
})

-- Disable command window
vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
    callback = function()
        vim.cmd("quit")
    end,
})

-- Automatic window organisation
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
