local Enchantment = import("org.bukkit.enchantments.Enchantment")


---@alias bukkit.enchantments.Enchantment* string
---| "PROTECTION"
---| "FIRE_PROTECTION"
---| "FEATHER_FALLING"
---| "BLAST_PROTECTION"
---| "PROJECTILE_PROTECTION"
---| "RESPIRATION"
---| "AQUA_AFFINITY"
---| "THORNS"
---| "DEPTH_STRIDER"
---| "FROST_WALKER"
---| "BINDING_CURSE"
---| "SHARPNESS"
---| "SMITE"
---| "BANE_OF_ARTHROPODS"
---| "KNOCKBACK"
---| "FIRE_ASPECT"
---| "LOOTING"
---| "SWEEPING_EDGE"
---| "EFFICIENCY"
---| "SILK_TOUCH"
---| "UNBREAKING"
---| "FORTUNE"
---| "POWER"
---| "PUNCH"
---| "FLAME"
---| "INFINITY"
---| "LUCK_OF_THE_SEA"
---| "LURE"
---| "LOYALTY"
---| "IMPALING"
---| "RIPTIDE"
---| "CHANNELING"
---| "MULTISHOT"
---| "QUICK_CHARGE"
---| "PIERCING"
---| "DENSITY"
---| "BREACH"
---| "WIND_BURST"
---| "MENDING"
---| "VANISHING_CURSE"
---| "SOUL_SPEED"
---| "SWIFT_SNEAK"

---org.bukkit.enchantments.Enchantment
---@class bukkit.enchantments.Enchantment : bukkit.Keyed, bukkit.Translatable, bukkit.registry.RegistryAware
---@field getMaxLevel fun(): integer
---@field getStartLevel fun(): integer
---@field conflictsWith fun(other: bukkit.enchantments.Enchantment): boolean
---@field canEnchantItem fun(item: bukkit.ItemStack): boolean

---@param id bukkit.enchantments.Enchantment*|bukkit.NamespacedKey|bukkit.enchantments.Enchantment
---@return bukkit.enchantments.Enchantment
function bukkit.enchantment(id)
    if type(id) == "string" then
        return Enchantment.getByName(id)
    end
    if bukkit.isNamespacedKey(id) then
        ---@cast id bukkit.NamespacedKey
        return bukkit.registry.ENCHANTMENT.getOrThrow(id)
    end
    ---@cast id bukkit.enchantments.Enchantment
    return id
end

-- TODO: offer, target
