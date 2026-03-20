local Pattern = import("org.bukkit.block.banner.Pattern")
local PatternType = import("org.bukkit.block.banner.PatternType")


---@param name bukkit.block.banner.PatternType*|bukkit.block.banner.PatternType
---@return bukkit.block.banner.PatternType
function bukkit.bannerPatternType(name)
    -- TODO
    if type(name) ~= "string" then return name end
    return PatternType[name]
end

---@param color bukkit.DyeColor*|bukkit.DyeColor
---@param pattern bukkit.block.banner.PatternType*|bukkit.block.banner.PatternType
---@return bukkit.block.banner.Pattern
function bukkit.bannerPattern(color, pattern)
    return Pattern(bukkit.dyeColor(color), bukkit.bannerPatternType(pattern))
end
