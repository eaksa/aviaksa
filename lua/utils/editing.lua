local M = {}

function M.rename_all_references()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
end

-- function M.toggle_spotify()
-- 	local spotify_tui = Terminal:new({ cmd = "spt", hidden = true })
-- 	spotify_tui:toggle()
-- end

return M
