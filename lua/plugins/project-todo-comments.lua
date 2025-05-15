local M = {
    "folke/todo-comments.nvim",
	version = "^1.4.0",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
        },
    },
    event = "VeryLazy",
}

function M.config()
    local status_ok, todo_comments = pcall(require, "todo-comments")
    if not status_ok then
        return
    end
    todo_comments.setup({})
end

return M
