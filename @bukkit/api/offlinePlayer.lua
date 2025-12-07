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
