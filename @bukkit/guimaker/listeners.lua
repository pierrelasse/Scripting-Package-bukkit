local InventoryCloseEvent = import("org.bukkit.event.inventory.InventoryCloseEvent")
local InventoryClickEvent = import("org.bukkit.event.inventory.InventoryClickEvent")
local InventoryDragEvent = import("org.bukkit.event.inventory.InventoryDragEvent")
local InventoryMoveItemEvent = import("org.bukkit.event.inventory.InventoryMoveItemEvent")


local GUIHolder = bukkit.guimaker.GUIHolder
local getGUIFromInventory = bukkit.guimaker.getGUIFromInventory

events.onStopping(function()
    for p in bukkit.playersLoop() do
        local inv = p.getOpenInventory().getTopInventory()
        if inv ~= nil then
            local holder = inv.getHolder()
            if instanceof(holder, GUIHolder) then
                p.closeInventory()
            end
        end
    end
end)

events.listen(InventoryCloseEvent, function(event)
    local inv = event.getInventory() ---@type bukkit.inventory.Inventory

    local gui = getGUIFromInventory(inv)
    if gui == nil or gui.onClose == nil then return end

    local player = event.getPlayer() ---@type bukkit.entity.Player

    gui.onClose(player)
end)

events.listen(InventoryClickEvent, function(event)
    local view = event.getView() ---@type bukkit.inventory.InventoryView
    local topInv = view.getTopInventory()

    local gui = getGUIFromInventory(topInv)
    if gui == nil then return end

    local inv = event.getClickedInventory() ---@type bukkit.inventory.Inventory?
    if inv == nil then return end

    local player = event.getWhoClicked() ---@type bukkit.entity.Player

    --- @type bukkit.guimaker.ClickEvent
    local ev = {
        event = event,
        cancelled = event.isCancelled(),
        player = player,
        type = event.getClick().name(),
        action = event.getAction().name(),
        slotType = event.getSlotType().name(),
        slot = event.getSlot(),
        itemStack = event.getCurrentItem()
    }

    if topInv.equals(inv) then
        if gui.onClick ~= nil then
            gui.onClick(player, ev)
        end
    elseif gui.onClickOther ~= nil then
        gui.onClickOther(player, ev)
    end

    event.setCancelled(ev.cancelled)
end)
    .priority("LOW")

events.listen(InventoryDragEvent, function(event)
    local inv = event.getInventory() ---@type bukkit.inventory.Inventory

    local gui = getGUIFromInventory(inv)
    if gui == nil or gui.onDrag == nil then return end

    local player = event.getWhoClicked() ---@type bukkit.entity.Player

    gui.onDrag(player, {
        event = event,
        type = event.getType().name(),
        cursor = event.getCursor(),
        oldCursor = event.getOldCursor()
    })
end)
    .priority("LOW")

-- TODO: remove?
events.listen(InventoryMoveItemEvent, function(event)
    local sourceInv = event.getSource() ---@type bukkit.inventory.Inventory
    local destinationInv = event.getDestination() ---@type bukkit.inventory.Inventory

    local gui = getGUIFromInventory(sourceInv)
        or getGUIFromInventory(destinationInv)
    if gui == nil or gui.onMove == nil then return end

    local player = event.getWhoClicked() ---@type bukkit.entity.Player

    gui.onMove(player, event)
end)
    .priority("LOW")
