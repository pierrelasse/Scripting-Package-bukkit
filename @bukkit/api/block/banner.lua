local Pattern = import("org.bukkit.block.banner.Pattern")
local PatternType = import("org.bukkit.block.banner.PatternType")


---@alias bukkit.block.banner.PatternType* string
---| "BASE"
---| "SQUARE_BOTTOM_LEFT"
---| "SQUARE_BOTTOM_RIGHT"
---| "SQUARE_TOP_LEFT"
---| "SQUARE_TOP_RIGHT"
---| "STRIPE_BOTTOM"
---| "STRIPE_TOP"
---| "STRIPE_LEFT"
---| "STRIPE_RIGHT"
---| "STRIPE_CENTER"
---| "STRIPE_MIDDLE"
---| "STRIPE_DOWNRIGHT"
---| "STRIPE_DOWNLEFT"
---| "SMALL_STRIPES"
---| "CROSS"
---| "STRAIGHT_CROSS"
---| "TRIANGLE_BOTTOM"
---| "TRIANGLE_TOP"
---| "TRIANGLES_BOTTOM"
---| "TRIANGLES_TOP"
---| "DIAGONAL_LEFT"
---| "DIAGONAL_UP_RIGHT"
---| "DIAGONAL_UP_LEFT"
---| "DIAGONAL_RIGHT"
---| "CIRCLE"
---| "RHOMBUS"
---| "HALF_VERTICAL"
---| "HALF_HORIZONTAL"
---| "HALF_VERTICAL_RIGHT"
---| "HALF_HORIZONTAL_BOTTOM"
---| "BORDER"
---| "CURLY_BORDER"
---| "CREEPER"
---| "GRADIENT"
---| "GRADIENT_UP"
---| "BRICKS"
---| "SKULL"
---| "FLOWER"
---| "MOJANG"
---| "GLOBE"
---| "PIGLIN"
---| "FLOW"
---| "GUSTER"

---org.bukkit.block.banner.PatternType
---@class bukkit.block.banner.PatternType : java.Object

---@param name bukkit.block.banner.PatternType*|bukkit.block.banner.PatternType
---@return bukkit.block.banner.PatternType
function bukkit.bannerPatternType(name)
    -- TODO
    if type(name) ~= "string" then return name end
    return PatternType[name]
end

---org.bukkit.block.banner.Pattern
---@class bukkit.block.banner.Pattern : java.Object
--TODO

---@param color bukkit.DyeColor
---@param pattern bukkit.block.banner.PatternType*|bukkit.block.banner.PatternType
---@return bukkit.block.banner.Pattern
function bukkit.bannerPattern(color, pattern)
    return Pattern(color, bukkit.bannerPatternType(pattern))
end
