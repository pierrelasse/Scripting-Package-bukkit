local DyeColor = import("org.bukkit.DyeColor")


---@alias bukkit.DyeColor* string
---| "WHITE"
---| "ORANGE"
---| "MAGENTA"
---| "LIGHT_BLUE"
---| "YELLOW"
---| "LIME"
---| "PINK"
---| "GRAY"
---| "LIGHT_GRAY"
---| "CYAN"
---| "PURPLE"
---| "BLUE"
---| "BROWN"
---| "GREEN"
---| "RED"
---| "BLACK"

---org.bukkit.DyeColor
---@class bukkit.DyeColor : java.Object
---@field getColor fun(): bukkit.Color
---@field getFireworkColor fun(): bukkit.Color

---@param name bukkit.DyeColor*|bukkit.DyeColor
---@return bukkit.DyeColor
function bukkit.dyeColor(name)
    if type(name) ~= "string" then return name end
    return DyeColor.valueOf(name)
end

---@param color bukkit.Color
---@return bukkit.DyeColor?
function bukkit.dyeColorByColor(color)
    return DyeColor.getByColor(color)
end

---@param color bukkit.Color
---@return bukkit.DyeColor?
function bukkit.dyeColorByFireworkColor(color)
    return DyeColor.getByFireworkColor(color)
end
