classloader.addClassFile("@bukkit/guimaker", "bukkit_guimaker_GUIHolder")
local GUIHolder = import("bukkit_guimaker_GUIHolder")

local this = {
    GUIHolder = GUIHolder
}

---@class bukkit.guimaker.ClickEvent
---@field event java.Object org.bukkit.event.inventory.InventoryClickEvent
---@field cancelled boolean
---@field player bukkit.entity.Player
---@field type "LEFT"
---    |"SHIFT_LEFT"
---    |"RIGHT"
---    |"SHIFT_RIGHT"
---    |"WINDOW_BORDER_LEFT"
---    |"WINDOW_BORDER_RIGHT"
---    |"MIDDLE"
---    |"NUMBER_KEY"
---    |"DOUBLE_CLICK"
---    |"DROP"
---    |"CONTROL_DROP"
---    |"CREATIVE"
---    |"SWAP_OFFHAND"
---    |"UNKNOWN"
---@field action "NOTHING"
---    |"PICKUP_ALL"
---    |"PICKUP_SOME"
---    |"PICKUP_HALF"
---    |"PICKUP_ONE"
---    |"PLACE_ALL"
---    |"PLACE_SOME"
---    |"PLACE_ONE"
---    |"SWAP_WITH_CURSOR"
---    |"DROP_ALL_CURSOR"
---    |"DROP_ONE_CURSOR"
---    |"DROP_ALL_SLOT"
---    |"DROP_ONE_SLOT"
---    |"MOVE_TO_OTHER_INVENTORY"
---    |"HOTBAR_MOVE_AND_READD"
---    |"HOTBAR_SWAP"
---    |"CLONE_STACK"
---    |"COLLECT_TO_CURSOR"
---    |"UNKNOWN"
---@field slotType "RESULT"
---    |"CRAFTING"
---    |"ARMOR"
---    |"CONTAINER"
---    |"QUICKBAR"
---    |"OUTSIDE"
---    |"FUEL"
---@field slot integer
---@field itemStack java.Object

---@class bukkit.guimaker.DragEvent
---@field event java.Object
---@field type "SINGLE"|"EVEN"
---@field cursor bukkit.ItemStack
---@field oldCursor bukkit.ItemStack

---@param inventory java.Object
---@return bukkit.guimaker.GUI?
function this.getGUIFromInventory(inventory)
    if inventory == nil then return end
    local holder = inventory.getHolder()
    if not instanceof(holder, GUIHolder) then return end
    return holder.gui
end

bukkit.guimaker = this

require("@bukkit/guimaker/listeners")
require("@bukkit/guimaker/Screen")
