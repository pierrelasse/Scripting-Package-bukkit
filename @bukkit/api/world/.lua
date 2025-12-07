local World = import("org.bukkit.World")


---@param o bukkit.World|any
function bukkit.isWorld(o) return instanceof(o, World) end

---@type bukkit.World
bukkit.baseWorld = bukkit.Bukkit.getWorlds().get(0)

---@return java.Collection<bukkit.World>
function bukkit.worlds() return bukkit.Bukkit.getWorlds() end

function bukkit.worldsLoop() return forEach(bukkit.worlds()) end

---@param name string|bukkit.World Name/id of the world
---@return bukkit.World?
function bukkit.world(name)
    if type(name) ~= "string" then return name end
    return bukkit.Bukkit.getWorld(name)
end

---@param uid java.Object java.util.UUID
---@return bukkit.World?
function bukkit.worldUID(uid)
    return bukkit.Bukkit.getWorld(uid)
end

--TODO: Might change
---@param s any|string
function bukkit.isValidWorldName(s)
    return type(s) == "string"
        and s:match("[A-Za-z0-9_\\-/]+")
        and numbers.between(#s, 3, 32)
end
