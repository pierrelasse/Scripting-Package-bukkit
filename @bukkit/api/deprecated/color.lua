local Color = import("org.bukkit.Color")


---@alias bukkit.Color* string
---| "WHITE"
---| "SILVER"
---| "GRAY"
---| "BLACK"
---| "RED"
---| "MAROON"
---| "YELLOW"
---| "OLIVE"
---| "LIME"
---| "GREEN"
---| "AQUA"
---| "TEAL"
---| "BLUE"
---| "NAVY"
---| "FUCHSIA"
---| "PURPLE"
---| "ORANGE"

---org.bukkit.Color
---@class bukkit.Color : java.Object
---@field getAlpha fun(): integer
---@field getRed fun(): integer
---@field getGreen fun(): integer
---@field getBlue fun(): integer

---@param name bukkit.Color*|bukkit.Color
---@return bukkit.Color
function bukkit.colorByName(name)
    if type(name) ~= "string" then return name end
    return Color[name]
end

---@param r integer 0-255
---@param g integer 0-255
---@param b integer 0-255
---@param a? integer 0-255
---@return bukkit.Color
function bukkit.color(r, g, b, a)
    if a == nil then
        return Color.fromRGB(r, g, b)
    else
        return Color.fromARGB(a, r, g, b)
    end
end

---Creates a new color object from an integer that contains the<br>
---red, green, and blue bytes in the lowest order 24 bits.
---@param rgb integer
---@return bukkit.Color
function bukkit.colorRGB(rgb)
    return Color.fromRGB(rgb)
end

---Creates a new color object from an integer that contains the alpha, red, green, and blue bytes.
---@param argb integer
---@return bukkit.Color
function bukkit.colorARGB(argb)
    return Color.fromARGB(argb)
end
