local Attribute = import("org.bukkit.attribute.Attribute")
local AttributeModifier = import("org.bukkit.attribute.AttributeModifier")
local AttributeModifier_Operation = import("org.bukkit.attribute.AttributeModifier$Operation")


---@param id bukkit.attribute.Attribute*|bukkit.NamespacedKey|bukkit.attribute.Attribute
---@return bukkit.attribute.Attribute
function bukkit.attribute(id)
    if type(id) == "string" then
        return Attribute.valueOf(id)
    end
    if bukkit.isNamespacedKey(id) then ---@cast id bukkit.NamespacedKey
        return bukkit.registry.ATTRIBUTE.getOrThrow(id)
    end
    ---@cast id bukkit.attribute.Attribute
    return id
end

---@param name bukkit.attribute.AttributeModifierOperation*|bukkit.attribute.AttributeModifierOperation
---@return bukkit.attribute.AttributeModifierOperation
function bukkit.attributeModifierOperation(name)
    if type(name) ~= "string" then return name end
    return AttributeModifier_Operation.valueOf(name)
end

---@param key string|bukkit.NamespacedKey
---@param amount number
---@param operation bukkit.attribute.AttributeModifierOperation*|bukkit.attribute.AttributeModifierOperation
---@param slot? bukkit.inventory.EquipmentSlotGroup*|bukkit.inventory.EquipmentSlotGroup
---@return bukkit.attribute.AttributeModifier
function bukkit.attributeModifier(key, amount, operation, slot)
    if slot == nil then slot = "ANY" end
    return AttributeModifier(
        bukkit.namespacedKey(key),
        amount,
        bukkit.attributeModifierOperation(operation),
        bukkit.equipmentSlotGroup(slot)
    )
end
