-- Open NvimTree if buffer is a directory or a [No Name]
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function(data)
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
        local directory = vim.fn.isdirectory(data.file) == 1
        if not no_name and not directory then
            return
        end
        if directory then
            vim.cmd.cd(data.file)
        end
        require("nvim-tree.api").tree.open()
    end,
})

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
