local Player = import("org.bukkit.entity.Player")


---@param v bukkit.entity.Player|any
function bukkit.isPlayer(v) return instanceof(v, Player) end

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
