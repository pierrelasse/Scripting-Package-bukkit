classloader.addClassFile("@bukkit/guimaker", "bukkit_guimaker_GUIHolder")
local GUIHolder = import("bukkit_guimaker_GUIHolder")

local this = {
    GUIHolder = GUIHolder
}

---@param inventory java.Object
---@return nil|bukkit.guimaker.GUI|bukkit.guimaker.Screen
function this.getGUIFromInventory(inventory)
    if inventory == nil then return end
    local holder = inventory.getHolder()
    if not instanceof(holder, GUIHolder) then return end
    return holder.gui
end

bukkit.guimaker = this

require("@bukkit/guimaker/listeners")
require("@bukkit/guimaker/Screen")
