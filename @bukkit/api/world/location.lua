local Location = import("org.bukkit.Location")


---@param o any|bukkit.Location
---@return boolean
function bukkit.isLocation(o) return instanceof(o, Location) end

---@param x number
---@param y number
---@param z number
---@return bukkit.Location
function bukkit.location3(x, y, z) return Location(nil, x, y, z) end

---@param world bukkit.World?
---@param x number
---@param y number
---@param z number
---@return bukkit.Location
function bukkit.location4(world, x, y, z) return Location(world, x, y, z) end

---@param world bukkit.World?
---@param x number
---@param y number
---@param z number
---@param yaw number
---@param pitch number
---@return bukkit.Location
function bukkit.location6(world, x, y, z, yaw, pitch) return Location(world, x, y, z, yaw, pitch) end

---@param world bukkit.World?
---@param data { [1]: number; [2]: number; [3]: number; [4]?: number; [5]?: number; } { x, y, z, yaw?, pitch? }
---@return bukkit.Location
function bukkit.locationU(world, data) return Location(world, table.unpack(data, 1, #data == 5 and 5 or 3)) end

---@param a bukkit.Location
---@param b bukkit.Location
function bukkit.distance(a, b)
    if a == nil or b == nil then return math.huge end
    if a.getWorld() ~= b.getWorld() then return math.huge end
    return a.distance(b)
end

---@param a bukkit.Location
---@param b bukkit.Location
function bukkit.distanceSquared(a, b)
    if a == nil or b == nil then return math.huge end
    if a.getWorld() ~= b.getWorld() then return math.huge end
    return a.distanceSquared(b)
end
