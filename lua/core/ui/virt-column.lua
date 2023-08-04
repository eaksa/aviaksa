local M = {
    -- 24 Jul 2023
    "lukas-reineke/virt-column.nvim",
    commit = "1917bfb519729dea7b4f5d13aa9c810c9579b0ea",
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
