local M = {}

M.gui_fg = function(element)
    return string.format(
        "#%06x",
        vim.api.nvim_get_hl_by_name(element, true).foreground
    )
end

M.gui_bg = function(element)
    return string.format(
        "#%06x",
        vim.api.nvim_get_hl_by_name(element, true).background
    )
end

M.brighten = function(hex, n)
    local r, g, b =
        string.sub(hex, 2, 3), string.sub(hex, 4, 5), string.sub(hex, 6, 7)
    local brighten_hex = function(val)
        local m = tonumber(val, 16)
        m = m + (n * m)
        if m > 255 then
            m = 255
        end
        return string.format("%x", m)
    end
    return "#" .. brighten_hex(r) .. brighten_hex(g) .. brighten_hex(b)
end

M.darken = function(hex, n)
    local r, g, b =
        string.sub(hex, 2, 3), string.sub(hex, 4, 5), string.sub(hex, 6, 7)
    local darken_hex = function(val)
        local m = tonumber(val, 16)
        return string.format("%x", m - (n * m))
    end
    return "#" .. darken_hex(r) .. darken_hex(g) .. darken_hex(b)
end

return M
