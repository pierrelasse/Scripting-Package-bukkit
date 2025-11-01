---@diagnostic disable: deprecated

---@class bukkit.guimaker.Screen.SlotListener
---@field click? fun(event: bukkit.guimaker.ClickEvent)
---@field drag? fun(event: bukkit.guimaker.DragEvent)
---@field take? fun(event: bukkit.guimaker.TakeEvent)
---@field put? fun(event: bukkit.guimaker.PutEvent)

---@class bukkit.guimaker.Screen
---@field package inv bukkit.inventory.Inventory
---@field package closeListeners? java.List<core.Closeable>
---@field package slotListeners? java.Map<integer, bukkit.guimaker.Screen.SlotListener>
---
---@field onDrag? fun(event: bukkit.guimaker.DragEvent)
---@field onTake? fun(event: bukkit.guimaker.TakeEvent)
---@field onPut? fun(event: bukkit.guimaker.PutEvent)
local this = {
    ---@deprecated
    ---@type nil|fun(viewer: bukkit.entity.Player)
    onOpen = nil,
    ---@deprecated
    ---@type nil|fun(viewer: bukkit.entity.Player)
    onClose = nil,
    ---@deprecated
    ---@type nil|fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.ClickEvent)
    onClick = nil,
    ---@deprecated
    ---@type nil|fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.ClickEvent)
    onClickOther = nil
}
this.__index = this

---@param title string|adventure.text.Component
---@param rowsOrType integer|bukkit.inventory.InventoryType|bukkit.inventory.InventoryType*=`6`
function this.new(title, rowsOrType)
    if rowsOrType == nil or type(rowsOrType) == "number" then
        rowsOrType = 9 * (rowsOrType or 6)
    end

    local self = setmetatable({}, this)

    local holder = bukkit.guimaker.GUIHolder(self)
    local inv = title == nil
        and bukkit.Bukkit.createInventory(holder, rowsOrType)
        or bukkit.Bukkit.createInventory(holder, rowsOrType, title)
    holder.setInventory(inv)
    self.inv = inv

    self.slotListeners = java.map()

    self.onClose = function(viewer)
        if self.closeListeners ~= nil then
            for c in forEach(self.closeListeners) do
                ((type(c) == "table") and c.close or c)()
            end
        end
    end

    self.onClick = function(viewer, event)
        event.cancelled = true
        local listener = self.slotListeners.get(event.slot + 1)
        if listener and listener.click then listener.click(event) end
    end

    self.onClickOther = function(viewer, event)
    end

    self.onDrag = function(event)
        event.cancelled = true
        local listener = self.slotListeners.get(event.slot)
        if listener and listener.drag then listener.drag(event) end
    end

    self.onTake = function(event)
        event.cancelled = true
        local listener = self.slotListeners.get(event.slot)
        if listener and listener.take then listener.take(event) end
    end

    self.onPut = function(event)
        event.cancelled = true
        local listener = self.slotListeners.get(event.slot)
        if listener and listener.put then listener.put(event) end
    end

    return self
end

---@protected
---@return bukkit.guimaker.Screen?
function this.getGUI(inv)
    if inv == nil then return end
    local holder = inv.getHolder() ---@type bukkit.inventory.InventoryHolder
    if not instanceof(holder, bukkit.guimaker.GUIHolder) then return end
    return holder.gui
end

function this:slotAmount()
    return self.inv.getSize()
end

---@param c core.Closeable
function this:closeable(c)
    if self.closeListeners == nil then self.closeListeners = java.list() end
    self.closeListeners.add(c)
end

--#region Viewer

---@param viewer bukkit.entity.Player
function this:hasOpen(viewer)
    return this.getGUI(viewer
            .getOpenInventory()
            .getTopInventory())
        == self
end

---@param viewer bukkit.entity.Player
function this:open(viewer)
    return viewer.openInventory(self.inv)
end

---@param viewer bukkit.entity.Player
function this:close(viewer)
    if self:hasOpen(viewer) then
        viewer.closeInventory()
    end
end

--#endregion

---@deprecated
---@param slot integer 0-based
function this:get(slot)
    return self.inv.getItem(slot)
end

---@param slot integer
function this:get1(slot)
    return self:get(slot - 1)
end

---@deprecated
---@param slot integer 0-based
---@param item bukkit.ItemStack?
function this:set(slot, item)
    self.inv.setItem(slot, item)
end

---@param slot integer
---@param item bukkit.ItemStack?
function this:set1(slot, item)
    return self:set(slot - 1, item)
end

--#region Util

---@deprecated
---@param row integer
---@param column integer
function this:slot(row, column)
    local i = (row - 1) * 9 + (column - 1)
    if not numbers.between(i, 0, self:slotAmount() - 1) then error("bad {row="..row..",column="..column.."}", 2) end
    return i
end

---@param row integer
---@param column integer
function this:slot1(row, column)
    return self:slot(row, column) + 1
end

---@param item bukkit.ItemStack?
---@param from? integer
---@param to? integer
function this:fill(item, from, to)
    if from == nil then from = 1 end
    if to == nil then to = self:slotAmount() end
    for slot = from, to do
        self:set1(slot, item)
    end
end

--#endregion

--#region Listeners

---@deprecated
---@param slot integer
---@param cb (fun(event: bukkit.guimaker.ClickEvent))?
function this:click(slot, cb)
    self:listen(slot + 1, { click = cb })
end

---@param slot integer
---@param cb nil|fun(event: bukkit.guimaker.ClickEvent)
function this:click1(slot, cb)
    self:listen(slot, { click = cb })
end

---@deprecated
---@param slot integer
---@param item bukkit.ItemStack
---@param cb? fun()|fun(event: bukkit.guimaker.ClickEvent)
function this:button(slot, item, cb)
    self:set(slot, item)
    self:click(slot, cb)
end

---@param slot integer
---@param item bukkit.ItemStack
---@param cb? fun()|fun(event: bukkit.guimaker.ClickEvent)
function this:button1(slot, item, cb)
    self:click1(slot, cb)
    self:set1(slot, item)
end

---@param slot integer
---@param listener nil|bukkit.guimaker.Screen.SlotListener
function this:listen(slot, listener)
    if listener == nil then
        self.slotListeners.remove(slot)
    else
        self.slotListeners.put(slot, listener)
    end
end

--#endregion

---Experimental.
---@param title string
---@param view bukkit.inventory.InventoryView
function this:rename(title, view)
    if view.getTitle() == title then return end
    view.setTitle(title)
end

bukkit.guimaker.Screen = this
