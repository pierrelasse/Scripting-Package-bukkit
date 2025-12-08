local Color = import("org.bukkit.Color")


---@deprecated
function bukkit.colorRGB(rgb)
    scripting.warningDeprecated("bukkit.colorRGB")
    return Color.fromRGB(rgb)
end

---@deprecated
function bukkit.colorARGB(argb)
    scripting.warningDeprecated("bukkit.colorARGB")
    return Color.fromARGB(argb)
end

---@param v bukkit.Color|any
function bukkit.isColor(v) return instanceof(v, Color) end

---@overload fun(textColor: adventure.text.format.TextColor, alpha?: integer): bukkit.Color
---@overload fun(color: bukkit.Color): bukkit.Color
---@overload fun(id: bukkit.Color*): bukkit.Color
---@param r integer 0-255
---@param g integer 0-255
---@param b integer 0-255
---@param a? integer 0-255
---@return bukkit.Color
function bukkit.color(r, g, b, a)
    if bukkit.isColor(r) then
        local color
        color = r ---@cast color bukkit.Color
        return color
    end

    if type(r) == "string" then
        local id
        id = r ---@cast id bukkit.Color*
        return Color[id:upper()]
    end

    if adventure and adventure.isColor(r) then
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
