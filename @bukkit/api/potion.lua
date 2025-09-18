local PotionType = import("org.bukkit.potion.PotionType")
local PotionData = import("org.bukkit.potion.PotionData")


---@alias bukkit.PotionType string
---| "WATER"
---| "MUNDANE"
---| "THICK"
---| "AWKWARD"
---| "NIGHT_VISION"
---| "LONG_NIGHT_VISION"
---| "INVISIBILITY"
---| "LONG_INVISIBILITY"
---| "LEAPING"
---| "LONG_LEAPING"
---| "STRONG_LEAPING"
---| "FIRE_RESISTANCE"
---| "LONG_FIRE_RESISTANCE"
---| "SWIFTNESS"
---| "LONG_SWIFTNESS"
---| "STRONG_SWIFTNESS"
---| "SLOWNESS"
---| "LONG_SLOWNESS"
---| "STRONG_SLOWNESS"
---| "WATER_BREATHING"
---| "LONG_WATER_BREATHING"
---| "HEALING"
---| "STRONG_HEALING"
---| "HARMING"
---| "STRONG_HARMING"
---| "POISON"
---| "LONG_POISON"
---| "STRONG_POISON"
---| "REGENERATION"
---| "LONG_REGENERATION"
---| "STRONG_REGENERATION"
---| "STRENGTH"
---| "LONG_STRENGTH"
---| "STRONG_STRENGTH"
---| "WEAKNESS"
---| "LONG_WEAKNESS"
---| "LUCK"
---| "TURTLE_MASTER"
---| "LONG_TURTLE_MASTER"
---| "STRONG_TURTLE_MASTER"
---| "SLOW_FALLING"
---| "LONG_SLOW_FALLING"
---| "WIND_CHARGED"
---| "WEAVING"
---| "OOZING"
---| "INFESTED"

---@param name bukkit.PotionType|java.Object
---@return java.Object potionType org.bukkit.potion.PotionType
function bukkit.potionType(name)
    if type(name) ~= "string" then return name end
    return PotionType[name]
end

---@param type bukkit.PotionType|java.Object
---@param extended? boolean=`true` whether the potion is extended PotionType#isExtendable() must be true
---@param upgraded? boolean=`true` whether the potion is upgraded PotionType#isUpgradable() must be true
---@return java.Object potionData org.bukkit.potion.PotionData
function bukkit.potionData(type, extended, upgraded)
    type = bukkit.potionType(type)
    if extended == nil then extended = true end
    if upgraded == nil then upgraded = true end
    return PotionData(
        type,
        extended,
        upgraded
    )
end
