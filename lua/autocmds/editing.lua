-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Refresh codelens when saving Java file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.java" },
    callback = function()
        vim.lsp.codelens.refresh()
    end,
})

-- Autoload venv when opening Python files
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "python" },
    callback = function()
        require("swenv.api").auto_venv()
    end
})
