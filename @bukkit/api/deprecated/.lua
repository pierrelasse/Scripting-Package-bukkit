---@deprecated
function bukkit.getPlatform()
    scripting.warningDeprecated("bukkit.getPlatform")
    return bukkit.platform
end

---@deprecated
function bukkit.strikeLightning(...)
    scripting.warningDeprecated("bukkit.strikeLightning")
    return bukkit.spawnLightning(...)
end

---@deprecated
function bukkit.createExplosion(...)
    scripting.warningDeprecated("bukkit.createExplosion")
    return bukkit.spawnExplosion(...)
end

---@deprecated
function bukkit.playSoundAt(locationOrPlayer, sound, volume, pitch)
    scripting.warningDeprecated("bukkit.playSoundAt")
    if bukkit.isPlayer(locationOrPlayer) then locationOrPlayer = locationOrPlayer.getLocation() end
    locationOrPlayer.getWorld()
        .playSound(locationOrPlayer, sound, volume or 1, pitch or 1)
end

---@deprecated
function bukkit.onlinePlayers()
    scripting.warningDeprecated("bukkit.onlinePlayers")
    return bukkit.players()
end

---@deprecated
function bukkit.onlinePlayersLoop()
    scripting.warningDeprecated("bukkit.onlinePlayersLoop")
    return bukkit.playersLoop()
end

---@deprecated
function bukkit.getPlayerClosest(...)
    scripting.warningDeprecated("bukkit.getPlayerClosest")
    return bukkit.playerClosest(...)
end

---@deprecated
function bukkit.getPlayerByUUIDObj(...)
    scripting.warningDeprecated("bukkit.getPlayerByUUIDObj")
    return bukkit.playerByUUIDObj(...) ---@diagnostic disable-line: deprecated
end

---@deprecated
function bukkit.getPlayerByUUID(...)
    scripting.warningDeprecated("bukkit/api/players#playerByUUID")
    return bukkit.playerByUUID(...)
end

---@deprecated
function bukkit.getOfflinePlayer(...)
    scripting.warningDeprecated("bukkit.offlinePlayer")
    return bukkit.offlinePlayer(...)
end

---@deprecated
function bukkit.getOfflinePlayerByUUID(...)
    scripting.warningDeprecated("bukkit.offlinePlayerByUUID")
    return bukkit.offlinePlayerByUUID(...)
end

---@deprecated
function bukkit.playerByUUIDObj(uuid)
    scripting.warningDeprecated("bukkit.playerByUUIDObj")
    if not java.isUUID(uuid) then return end
    return bukkit.Bukkit.getPlayer(uuid)
end

---@deprecated
function bukkit.getPlayer(...)
    scripting.warningDeprecated("bukkit.getPlayer")
    return bukkit.player(...)
end

---@deprecated
function bukkit.sendComponent(player, component)
    scripting.warningDeprecated("bukkit.sendComponent")
    player.spigot().sendMessage(component)
end

---@deprecated
function bukkit.sendActionBarComponent(player, component)
    scripting.warningDeprecated("bukkit.sendActionBarComponent")
    local ChatMessageType = import("net.md_5.bungee.api.ChatMessageType")
    player.spigot().sendMessage(ChatMessageType.ACTION_BAR, component)
end

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

---@deprecated
function bukkit.uuidFromString(o) return java.uuidFromString(o) end

---@deprecated
function bukkit.hex(...) return bukkit.components.convertHex(...) end

---@deprecated
function bukkit.defaultWorld() return bukkit.baseWorld end
