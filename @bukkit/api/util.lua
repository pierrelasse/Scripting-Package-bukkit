--#region Vector
local Vector = import("org.bukkit.util.Vector")


---@param x number
---@param y number
---@param z number
---@return bukkit.Vector
function bukkit.vector(x, y, z)
    return Vector(x, y, z)
end

---@param location bukkit.Location
---@param vector bukkit.Vector
---@return bukkit.Location
function bukkit.addVec(location, vector)
    return location
        .toVector()
        .add(vector)
        .toLocation(location.getWorld()) ---@diagnostic disable-line: param-type-mismatch
end

--#endregion
