local M = {}

local default_leader = " "

M.leader = function(key)
    key = key or default_leader
    vim.keymap.set("", key, "<Nop>", { silent = true })
    vim.g.mapleader = key
end

local default_opts = { silent = true }

-- If bufnr is given, then map is set to only that buffer
local map = function(mode, key, tbl, bufnr)
    mode = mode or ""
    bufnr = bufnr or nil

    -- Only accept numeric indexing at individual keymaps
    -- Options in keygroups must be indexed with a key
    local cmd = tbl.cmd or tbl[1]
    local opts = tbl.opts or tbl[3] or default_opts or {}
    opts.desc = tbl.desc or tbl[2] or nil

    if bufnr then
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, cmd, opts)
    else
        vim.keymap.set(mode, key, cmd, opts)
    end
end

-- Recursively handles nested keygroups
M.set = function(mode, key, tbl, bufnr)
    mode = mode or ""
    bufnr = bufnr or nil
    local desc = tbl.desc or tbl[1] or nil
    local opts = tbl.opts or {}

    if tbl.keygroup then
        require("key-menu").set(mode, key, { desc = desc })

        for k, t in pairs(tbl.keygroup) do
            k = key .. k
            t.opts = t.opts or opts or {}
            M.set(mode, k, t, bufnr)
        end
    else
        map(mode, key, tbl, bufnr)
    end
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
    mode = get_handler(mode)
    bufnr = bufnr or nil
    for key, t in pairs(tbl) do
        M.set(mode, key, t, bufnr)
    end
end
return M
