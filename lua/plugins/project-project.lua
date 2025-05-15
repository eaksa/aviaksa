local M = {
    -- 04 Apr 2023
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
    dependencies = {
        {
            "nvim-telescope/telescope.nvim",
            event = "Bufenter",
            cmd = { "Telescope" },
        },
    },
}

function M.config()
    local project = require("project_nvim")
    project.setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "Makefile", "package.json" },
    })

    local telescope = require("telescope")
    telescope.load_extension("projects")
end

return M
