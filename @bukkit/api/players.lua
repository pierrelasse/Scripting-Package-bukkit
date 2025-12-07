--#region Player
local Player = import("org.bukkit.entity.Player")

---@param o any|bukkit.entity.Player
function bukkit.isPlayer(o) return instanceof(o, Player) end

---@param name string
---@return bukkit.entity.Player?
function bukkit.player(name)
    return bukkit.Bukkit.getPlayerExact(name)
end

---@param name string
---@return bukkit.entity.Player?
function bukkit.playerClosest(name)
    return bukkit.Bukkit.getPlayer(name)
end

---@param uuid nil|string|java.Object
---@return bukkit.entity.Player?
function bukkit.playerByUUID(uuid)
    if type(uuid) == "string" then uuid = java.uuidFromString(uuid) end
    if not java.isUUID(uuid) then return end
    return bukkit.Bukkit.getPlayer(uuid)
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
---@param fn? fun(p: bukkit.entity.Player)
---@return fun(): bukkit.entity.Player
function bukkit.playersLoop(fn)
    if fn == nil then return forEach(bukkit.players()) end

    for p in forEach(bukkit.players()) do
        fn(p)
    end

    return nil ---@diagnostic disable-line: return-type-mismatch
end

--#endregion

--#region Offline Player

---@param name string
---@return bukkit.OfflinePlayer?
function bukkit.offlinePlayer(name)
    return bukkit.Bukkit.getOfflinePlayer(name)
end

---@param uuid nil|string|java.Object
---@return bukkit.OfflinePlayer?
function bukkit.offlinePlayerByUUID(uuid)
    if type(uuid) == "string" then uuid = java.uuidFromString(uuid) end
    if not java.isUUID(uuid) then return end
    return bukkit.Bukkit.getOfflinePlayer(uuid)
end

---@return java.List<bukkit.OfflinePlayer>
function bukkit.offlinePlayers()
    return bukkit.Bukkit.getOfflinePlayers()
end

---@return fun(): bukkit.OfflinePlayer
function bukkit.offlinePlayersLoop()
    return forEach(bukkit.offlinePlayers())
end

--#endregion
