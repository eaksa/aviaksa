local M = {
    -- 04 Apr 2023
    "ahmedkhalf/project.nvim",
    commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
    dependencies = {
        {
            -- 01 Aug 2023
            "nvim-telescope/telescope.nvim",
            commit = "d2e17ba18a6840b7e7079764b282616c3188e0de",
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
