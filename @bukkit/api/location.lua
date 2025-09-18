local Location = import("org.bukkit.Location")


---@param o any|bukkit.Location
---@return boolean
function bukkit.isLocation(o)
    return instanceof(o, Location)
end

---@param x number
---@param y number
---@param z number
---@return bukkit.Location
function bukkit.location3(x, y, z)
    return Location(nil, x, y, z)
end

---@param world bukkit.World?
---@param x number
---@param y number
---@param z number
---@return bukkit.Location
function bukkit.location4(world, x, y, z)
    return Location(world, x, y, z)
end

---@param world bukkit.World?
---@param x number
---@param y number
---@param z number
---@param yaw number
---@param pitch number
---@return bukkit.Location
function bukkit.location6(world, x, y, z, yaw, pitch)
    return Location(world, x, y, z, yaw, pitch)
end

---@param world bukkit.World?
---@param data number[] { x, y, z, yaw?, pitch? }
function bukkit.locationU(world, data)
    return Location(world, table.unpack(data, 1, #data == 5 and 5 or 3))
end
