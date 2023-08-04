local M = {}

-- BUG: Newly opened terminal bugs out and disappears immediately
function M.toggle_lazygit()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
end

-- function M.toggle_spotify()
-- 	local spotify_tui = Terminal:new({ cmd = "spt", hidden = true })
-- 	spotify_tui:toggle()
-- end

return M
