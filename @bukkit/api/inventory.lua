local EquipmentSlot = import("org.bukkit.inventory.EquipmentSlot")
local EquipmentSlotGroup = import("org.bukkit.inventory.EquipmentSlotGroup")


---@param name bukkit.inventory.EquipmentSlot*|bukkit.inventory.EquipmentSlot
---@return bukkit.inventory.EquipmentSlot
function bukkit.equipmentSlot(name)
    if type(name) ~= "string" then return name end
    return EquipmentSlot.valueOf(name)
end

---@param name bukkit.inventory.EquipmentSlotGroup*|bukkit.inventory.EquipmentSlotGroup
---@return bukkit.inventory.EquipmentSlotGroup
function bukkit.equipmentSlotGroup(name)
    if type(name) ~= "string" then return name end
    return EquipmentSlotGroup.getByName(name)
end

--TODO
---@param ... bukkit.ItemStack
---@return java.array<bukkit.ItemStack>
function bukkit.itemArray(...)
    return arrayOf(...)
end

--TODO
---Adds item(s) to a entity's inventory.
---@param entity bukkit.entity.HumanEntity
---@param ... bukkit.ItemStack
function bukkit.addItem(entity, ...)
    entity.getInventory().addItem(bukkit.itemArray(...))
end

---Checks if an inventory has an empty slot.
---@deprecated
---@param inventory bukkit.inventory.Inventory
function bukkit.hasInventoryASlotFree(inventory)
    local contents = inventory.getContents()
    for i = 1, math.min(36, #contents) do
        if contents[i] == nil then
            return true
        end
    end
    return false
end

---@param inventory bukkit.inventory.Inventory
---@param itemStack bukkit.ItemStack
function bukkit.hasInventorySpace(inventory, itemStack)
    if itemStack == nil then return true end

    local remaining = itemStack.getAmount()
    if remaining <= 0 then return end

    local contents = inventory.getStorageContents()

    local AIR = bukkit.material("AIR")

    for i = 1, #contents do
        local slot = contents[i]
        if slot == nil or slot.getType() == AIR then
            remaining = remaining - itemStack.getMaxStackSize()
        elseif slot.isSimilar(itemStack) then
            remaining = remaining - (itemStack.getMaxStackSize() - slot.getAmount())
        end
        if remaining <= 0 then return true end
    end

    return false
end
