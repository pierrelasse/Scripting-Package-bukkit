---@class bukkit.guimaker.Screen
---@field inv bukkit.inventory.Inventory
---@field clickCb? table<integer, fun(event: bukkit.guimaker.ClickEvent)>
---
---@field onOpen? fun(viewer: bukkit.entity.Player)
---@field onClose? fun(viewer: bukkit.entity.Player)
---@field onClick? fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.ClickEvent)
---@field onClickOther? fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.ClickEvent)
---@field onDrag? fun(viewer: bukkit.entity.Player, event: bukkit.guimaker.DragEvent)
---@field onMove? fun(viewer: bukkit.entity.Player, event: java.Object)
local this = {}
this.__index = this

---@param title string
---@param rows integer
function this.new(title, rows)
    if rows == nil then rows = 6 end -- TODO

    local self = setmetatable({}, this)

    self.inv = bukkit.guimaker.GUIHolder(self, title, 9 * rows)
        .getInventory()

    self.onClick = function(viewer, event)
        event.cancelled = true

        if self.clickCb == nil then return end
        local cb = self.clickCb[event.slot]
        if cb == nil then return end

        local success, result = pcall(cb, event)
        if not success then
            print("§cError (screen) of §4"..viewer.getName().."§c: "..result)
            viewer.closeInventory()
            bukkit.send(viewer, "§cAn error occured while interacting with the screen")
        end
    end

    self.onClickOther = function(viewer, event)
        if event.action == "MOVE_TO_OTHER_INVENTORY" then
            event.cancelled = true -- TODO: use click event
        elseif event.action == "COLLECT_TO_CURSOR" then
            event.cancelled = true -- TODO: check if item is from upper inv
        end
    end

    self.onDrag = function(viewer, event)
        local view = event.event.getView() ---@type bukkit.inventory.InventoryView
        local rawSlots = event.event.getRawSlots() ---@type java.Set<integer>

        for rawSlot in forEach(rawSlots) do
            local slot = view.convertSlot(rawSlot)
            if slot == rawSlot then
                event.event.setCancelled(true)
                break
            end
        end
    end

    self.onMove = function(viewer, event)
        event.setCancelled(true)
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

---@param slot integer 0-based
function this:get(slot)
    return self.inv.getItem(slot)
end

---@param slot integer
function this:get1(slot)
    return self:get(slot - 1)
end

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

---@param viewer bukkit.entity.Player
function this:hasOpen(viewer)
    return this.getGUI(viewer
            .getOpenInventory()
            .getTopInventory())
        == self
end

---@param viewer bukkit.entity.Player
function this:open(viewer)
    viewer.openInventory(self.inv)
end

---@param viewer bukkit.entity.Player
function this:close(viewer)
    if self:hasOpen(viewer) then
        viewer.closeInventory()
    end
end

---@param slot integer
---@param cb (fun(event: bukkit.guimaker.ClickEvent))?
function this:click(slot, cb)
    if self.clickCb == nil then self.clickCb = {} end
    self.clickCb[slot] = cb
end

---@param slot integer
---@param item bukkit.ItemStack
---@param cb? fun()|fun(event: bukkit.guimaker.ClickEvent)
function this:button(slot, item, cb)
    self:set(slot, item)
    self:click(slot, cb)
end

---Might be unstable.
---@param title string
function this:rename(title)
    local prev = self.inv

    local new = bukkit.guimaker.GUIHolder(self, title, prev.getSize())
        .getInventory()
    new.setContents(prev.getContents())

    self.inv = new

    local prevOnClose = self.onClose
    self.onClose = nil

    for viewer in forEach(prev.getViewers().clone()) do
        viewer.openInventory(new)
    end

    self.onClose = prevOnClose
end

bukkit.guimaker.Screen = this
