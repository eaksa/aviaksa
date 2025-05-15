local M = {
    "lukas-reineke/indent-blankline.nvim",
	version = "^3.9.0",
    event = "BufReadPre",
}

-- TODO: Migrate from version 2 opts to version 3
-- M.opts = {
--     char = "∙",
--     show_trailing_blankline_indent = false,
--     show_first_indent_level = true,
--     use_treesitter = true,
--     show_current_context = true,
--     buftype_exclude = { "terminal", "nofile" },
--     filetype_exclude = {
--         "help",
--         "packer",
--         "NvimTree",
--     },
-- }

return M
