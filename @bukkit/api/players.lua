local Player = import("org.bukkit.entity.Player")


---@deprecated Use `bukkit.players()`
function bukkit.onlinePlayers()
    scripting.warningDeprecated("bukkit.onlinePlayers")
    return bukkit.players()
end

---@deprecated Use `bukkit.playersLoop()`
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
    return bukkit.playerByUUIDObj(...)
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

---@param o any|bukkit.entity.Player
function bukkit.isPlayer(o)
    return instanceof(o, Player)
end

---@return java.List<bukkit.entity.Player>
function bukkit.players()
    return bukkit.Bukkit.getOnlinePlayers()
end

---**Example:**
---```lua
---for player in bukkit.playersLoop() do
---  bukkit.send(player, "Foo!")
---end
---```
---
---@return fun(): bukkit.entity.Player
function bukkit.playersLoop()
    return forEach(bukkit.players())
end

---@return java.List<bukkit.OfflinePlayer>
function bukkit.offlinePlayers()
    return bukkit.Bukkit.getOfflinePlayers()
end

---@return fun(): bukkit.OfflinePlayer
function bukkit.offlinePlayersLoop()
    return forEach(bukkit.offlinePlayers())
end

---@param name string
---@return bukkit.entity.Player?
function bukkit.player(name)
    return bukkit.Bukkit.getPlayerExact(name)
end

bukkit.getPlayer = bukkit.player

---@param name string
---@return bukkit.entity.Player?
function bukkit.playerClosest(name)
    return bukkit.Bukkit.getPlayer(name)
end

function bukkit.playerByUUIDObj(uuid)
    if java.isUUID(uuid) then
        return bukkit.Bukkit.getPlayer(uuid)
    end
end

---@param uuid string
---@return bukkit.entity.Player?
function bukkit.playerByUUID(uuid)
    local uuidObj = bukkit.uuidFromString(uuid)
    return bukkit.playerByUUIDObj(uuidObj)
end

---@param name string
---@return bukkit.OfflinePlayer?
function bukkit.offlinePlayer(name)
    return bukkit.Bukkit.getOfflinePlayer(name)
end

---@param uuid java.Object?
---@return bukkit.OfflinePlayer?
function bukkit.offlinePlayerByUUID(uuid)
    if uuid == nil then return end
    return bukkit.Bukkit.getOfflinePlayer(uuid)
end
