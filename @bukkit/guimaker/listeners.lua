local InventoryCloseEvent = import("org.bukkit.event.inventory.InventoryCloseEvent")
local InventoryClickEvent = import("org.bukkit.event.inventory.InventoryClickEvent")
local InventoryDragEvent = import("org.bukkit.event.inventory.InventoryDragEvent")


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

---@diagnostic disable: deprecated

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

    local bottomInv = view.getBottomInventory()

    local player = event.getWhoClicked() ---@type bukkit.entity.Player

    local inv = event.getClickedInventory() ---@type bukkit.inventory.Inventory?

    local currentItem = event.getCurrentItem() ---@type bukkit.ItemStack?
    local cursor = event.getCursor() ---@cast cursor bukkit.ItemStack
    if cursor.getType().isAir() then cursor = nil end

    local action = event.getAction().name()

    local cancelled = event.isCancelled()
    event.setCancelled(true)

    local function callClickEv(handler)
        if handler == nil then return end

        --- @type bukkit.guimaker.ClickEvent
        local clickEv = {
            event = event,
            cancelled = cancelled,
            player = player,
            type = event.getClick().name(),
            action = action,
            slotType = event.getSlotType().name(),
            slot = event.getSlot(),
            ---@diagnostic disable-next-line: assign-type-mismatch -- TODO
            itemStack = currentItem
        }

        handler(player, clickEv)

        cancelled = clickEv.cancelled
    end

    if topInv.equals(inv) then
        callClickEv(gui.onClick)

        local slot = event.getSlot() + 1 ---@type integer
        ---@type bukkit.guimaker.EventBase
        local ev = {
            cancelled = cancelled,
            player = player,
            slot = slot
        }

        if currentItem ~= nil then
            if gui.onTake then
                ---@cast ev bukkit.guimaker.TakeEvent
                ev.prevItemStack = cursor
                ev.itemStack = currentItem

                gui.onTake(ev)

                cancelled = ev.cancelled
            end
        end

        if cursor ~= nil then
            if gui.onPut then
                ---@cast ev bukkit.guimaker.PutEvent
                ev.prevItemStack = currentItem
                ev.itemStack = cursor

                gui.onPut(ev)

                cancelled = ev.cancelled
            end
        end
    elseif bottomInv.equals(inv) then
        callClickEv(gui.onClickOther)

        if action == "MOVE_TO_OTHER_INVENTORY" and not cancelled and currentItem ~= nil then
            local movedItemStack = currentItem
            local amountToMove = movedItemStack.getAmount()
            local maxStack = movedItemStack.getMaxStackSize()

            for slot = 1, topInv.getSize() do
                if amountToMove <= 0 then break end

                local slotItemStack = topInv.getItem(slot - 1)
                if slotItemStack ~= nil and slotItemStack.isSimilar(movedItemStack) then
                    local space = maxStack - slotItemStack.getAmount()
                    if space > 0 then
                        local toAdd = math.min(space, amountToMove)

                        local addedItemStack = movedItemStack.clone()
                        addedItemStack.setAmount(toAdd)

                        ---@type bukkit.guimaker.PutEvent
                        local ev = {
                            cancelled = cancelled,
                            player = player,
                            slot = slot,

                            prevItemStack = slotItemStack,
                            itemStack = addedItemStack,
                        }
                        if gui.onPut then gui.onPut(ev) end
                        cancelled = ev.cancelled
                        if ev.cancelled then break end

                        amountToMove = amountToMove - toAdd
                    end
                end
            end

            if not cancelled then
                for slot = 1, topInv.getSize() do
                    if amountToMove <= 0 then break end

                    local slotItemStack = topInv.getItem(slot - 1)
                    if slotItemStack == nil then
                        local addedItemStack = movedItemStack.clone()
                        addedItemStack.setAmount(amountToMove)

                        ---@type bukkit.guimaker.PutEvent
                        local ev = {
                            cancelled = cancelled,
                            player = player,
                            slot = slot,

                            prevItemStack = slotItemStack,
                            itemStack = addedItemStack,
                        }
                        if gui.onPut then gui.onPut(ev) end
                        cancelled = ev.cancelled
                        if ev.cancelled then break end

                        amountToMove = 0
                    end
                end
            end
        end
    else
        -- TODO: outside
    end

    if action == "COLLECT_TO_CURSOR" and not cancelled and cursor ~= nil then
        local maxStack = cursor.getMaxStackSize()
        local totalCursor = cursor.getAmount()
        for slot = 1, topInv.getSize() do
            local itemStack = topInv.getItem(slot - 1)
            if itemStack ~= nil and itemStack.isSimilar(cursor) then
                local spaceLeft = maxStack - totalCursor
                if spaceLeft <= 0 then break end

                local toTake = math.min(itemStack.getAmount(), spaceLeft)
                totalCursor = totalCursor + toTake

                local evItemStack = itemStack.clone()
                evItemStack.setAmount(toTake)

                ---@type bukkit.guimaker.TakeEvent
                local ev = {
                    cancelled = cancelled,
                    player = player,
                    slot = slot,

                    prevItemStack = nil, -- TODO
                    itemStack = evItemStack,
                }
                if gui.onTake then gui.onTake(ev) end
                cancelled = ev.cancelled
            end
        end
    end

    event.setCancelled(cancelled)
end)
    .priority("LOW")

events.listen(InventoryDragEvent, function(event)
    local inv = event.getInventory() ---@type bukkit.inventory.Inventory

    local gui = getGUIFromInventory(inv)
    if gui == nil or gui.onDrag == nil then return end

    local view = event.getView() ---@type bukkit.inventory.InventoryView
    local player = event.getWhoClicked() ---@type bukkit.entity.Player
    local newItems = event.getNewItems() ---@type java.Map<integer, bukkit.ItemStack>

    for entry in forEach(newItems.entrySet()) do ---@cast entry java.Map.Entry<integer, bukkit.ItemStack>
        local rawSlot = entry.getKey()

        local slot = view.convertSlot(rawSlot)
        if slot == rawSlot then
            local itemStack = entry.getValue()

            ---@type bukkit.guimaker.EventBase
            local ev = {
                cancelled = event.isCancelled(),
                player = player,
                slot = slot + 1
            }
            ---@cast ev bukkit.guimaker.DragEvent
            ev.prevItemStack = nil -- TODO
            ev.itemStack = itemStack

            gui.onDrag(ev)

            if ev.cancelled then
                event.setCancelled(true)
                break
            end
        end
    end
end)
    .priority("LOW")
