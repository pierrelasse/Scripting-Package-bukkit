--#region Enchantment
local Enchantment = import("org.bukkit.enchantments.Enchantment")

---@param v bukkit.enchantments.Enchantment|any
function bukkit.isEnchantment(v) return instanceof(v, Enchantment) end

---@param id bukkit.enchantments.Enchantment*|bukkit.NamespacedKey|bukkit.enchantments.Enchantment
---@return bukkit.enchantments.Enchantment?
function bukkit.enchantment(id)
    if bukkit.isEnchantment(id) then ---@cast id bukkit.enchantments.Enchantment
        return id
    end ---@cast id bukkit.enchantments.Enchantment*|bukkit.NamespacedKey
    if type(id) == "string" and not id:contains(":") then
        return Enchantment.getByName(id) -- TODO
    end
    return bukkit.registry.ENCHANTMENT.get(bukkit.nsk(id))
end

--#endregion

--#region EnchantmentOffer
local EnchantmentOffer = import("org.bukkit.enchantments.EnchantmentOffer")

---@param v bukkit.enchantments.EnchantmentOffer|any
function bukkit.isEnchantmentOffer(v) return instanceof(v, EnchantmentOffer) end

---@param enchantment bukkit.enchantments.Enchantment*|bukkit.enchantments.Enchantment
---@param level integer
---@param cost integer
function bukkit.enchantmentOffer(enchantment, level, cost)
    return EnchantmentOffer(bukkit.enchantment(enchantment), level, cost)
end

--#endregion
