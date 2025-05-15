local M = {}

local default_leader = " "

M.leader = function(key)
    key = key or default_leader
    vim.keymap.set("", key, "<Nop>", { silent = true })
    vim.g.mapleader = key
end

local modes = {
    ["n"] = "normal",
    ["i"] = "insert",
    ["v"] = "visual",
    ["x"] = "visual_block",
    ["t"] = "term",
    ["c"] = "command",
}

local get_handler = function(mode)
    for handler, name in pairs(modes) do
        if mode == name then
            return handler
        end
    end
    return nil
end

-- Handles modal keymaps
M.mode_set = function(mode, tbl, bufnr)
	which_key = require("which-key")
	opts = {
		mode = get_handler(mode),
		buffer = bufnr or nil,
	}
	which_key.register(tbl, opts)
end
return M
