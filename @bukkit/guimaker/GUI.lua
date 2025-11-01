---@deprecated
---@class bukkit.guimaker.GUI
---@field inv bukkit.inventory.Inventory
---@field data any?
---
---@field onOpen? fun(viewer: bukkit.entity.Player)
---@field onClose? fun(viewer: bukkit.entity.Player)
---@field onClick? fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.ClickEvent)
---@field onClickOther? fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.ClickEvent)
local this = {}
this.__index = this

---@param title string
---@param sizeOrType? integer|java.Object
---@return bukkit.guimaker.GUI
function this.new(title, sizeOrType)
    local self = setmetatable({}, this)

    if sizeOrType == nil then sizeOrType = 9 * 6 end
    self.inv = bukkit.guimaker.GUIHolder(self, title, sizeOrType)
        .getInventory()

    return self
end

---@param player bukkit.entity.Player
function this:open(player)
    player.openInventory(self.inv)
end

---@param player bukkit.entity.Player
function this:close(player)
    if not self:hasOpen(player) then return end
    player.closeInventory()
end

---@param player bukkit.entity.Player
function this:hasOpen(player)
    return bukkit.guimaker.getGUIFromInventory(player.getOpenInventory().getTopInventory()) == self
end

function this:slotCount()
    return self.inv.getSize()
end

---@param slot integer
function this:get(slot)
    return self.inv.getItem(slot)
end

---@param slot integer
---@param itemStack bukkit.ItemStack?
function this:set(slot, itemStack)
    self.inv.setItem(slot, itemStack)
end

return this
