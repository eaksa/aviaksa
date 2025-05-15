local leader = " "

require("config").setup({ leader = leader })
require("autocmds")
require("keybinds").setup({ leader = leader })
