local Color = import("org.bukkit.Color")


---@overload fun(textColor: adventure.text.format.TextColor, alpha?: integer): bukkit.Color
---@param r integer 0-255
---@param g integer 0-255
---@param b integer 0-255
---@param a? integer 0-255
---@return bukkit.Color
function bukkit.color(r, g, b, a)
    if comp and comp.isColor(r) then
        local textColor
        textColor = r ---@cast textColor adventure.text.format.TextColor
        local alpha
        alpha = g ---@cast alpha integer?

        if alpha == nil then
            return Color.fromRGB(textColor.red(), textColor.green(), textColor.blue())
        else
            return Color.fromARGB(alpha, textColor.red(), textColor.green(), textColor.blue())
        end
    end

    if a == nil then
        return Color.fromRGB(r, g, b)
    else
        return Color.fromARGB(a, r, g, b)
    end
end
