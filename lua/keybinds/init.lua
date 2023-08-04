local M = {}

local utils = require("utils.keymap")
local keymaps = require("keybinds.global")

local default_config = { leader = " " }

M.setup = function(config)
    config = config or default_config
    utils.leader(config.leader)

    for mode, keys in pairs(keymaps) do
        utils.mode_set(mode, keys)
    end
end

return M
