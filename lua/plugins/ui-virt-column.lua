local M = {
    "lukas-reineke/virt-column.nvim",
	version = "^2.0.3",
    event = "BufReadPre",
}

function M.config()
    local status_ok, virt_column = pcall(require, "virt-column")
    if not status_ok then
        return
    end
    virt_column.setup({ char = "◂" })
end

return M
