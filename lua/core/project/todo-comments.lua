local M = {
    -- 29 Jul 2023
    "folke/todo-comments.nvim",
    commit = "3094ead8edfa9040de2421deddec55d3762f64d1",
    dependencies = {
        {
            -- 17 Jul 2023
            "nvim-lua/plenary.nvim",
            commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb",
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
