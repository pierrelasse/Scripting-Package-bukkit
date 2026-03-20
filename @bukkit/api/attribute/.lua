local this = {}

--#region Attribute
local Attribute = import("org.bukkit.attribute.Attribute")

---@param v bukkit.attribute.Attribute|any
function this.is(v) return instanceof(v, Attribute) end

---@param id bukkit.attribute.AttributeLike
---@return bukkit.attribute.Attribute?
function bukkit.attribute(id)
    if bukkit.attributes.is(id) then ---@cast id bukkit.attribute.Attribute
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.attribute.Attribute*

    if type(id) == "string" and not id:contains(":") then
        id = id:lower()
    end

    return bukkit.registry.ATTRIBUTE.get(bukkit.nsk(id))
end

--#endregion

--#region AttributeModifier_Operation
local AttributeModifier_Operation = import("org.bukkit.attribute.AttributeModifier$Operation")

---@param name bukkit.attribute.AttributeModifierOperation*|bukkit.attribute.AttributeModifierOperation
---@return bukkit.attribute.AttributeModifierOperation
function this.modifierOperation(name)
    if type(name) ~= "string" then return name end
    return AttributeModifier_Operation.valueOf(name:upper())
end

--#endregion

--#region AttributeModifier
local AttributeModifier = import("org.bukkit.attribute.AttributeModifier")

---@param key bukkit.NamespacedKeyLike
---@param amount number
---@param operation bukkit.attribute.AttributeModifierOperation*|bukkit.attribute.AttributeModifierOperation
---@param slot? bukkit.inventory.EquipmentSlotGroup*|bukkit.inventory.EquipmentSlotGroup
---@return bukkit.attribute.AttributeModifier
function this.modifier(key, amount, operation, slot)
    if slot == nil then slot = "any" end
    return AttributeModifier(
        bukkit.nsk(key),
        amount,
        this.modifierOperation(operation),
        bukkit.equipmentSlotGroup(slot)
    )
end

--#endregion

---@deprecated
bukkit.attributeModifier = this.modifier
---@deprecated
bukkit.attributeModifierOperation = this.modifierOperation

bukkit.attributes = this
