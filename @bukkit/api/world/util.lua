---@param location bukkit.Location|bukkit.Entity
---@param radius number|bukkit.tVec6
---@param filter? fun(ent: bukkit.Entity): nil|false|boolean
---@param fn? fun(ent: bukkit.Entity)
function bukkit.nearbyEntities(location, radius, filter, fn)
    if bukkit.isEntity(location) then ---@cast location bukkit.Entity
        location = location.getLocation() ---@cast location bukkit.Location
    end

    ---@type number, number, number
    local radiusX, radiusY, radiusZ
    if type(radius) == "table" then
        radiusX = radius[1]
        radiusY = radius[2]
        radiusZ = radius[3]
    else
        radiusX = radius
        radiusY = radius
        radiusZ = radius
    end

    local predicate ---@type java.Predicate<bukkit.Entity>?
    if filter ~= nil then
        predicate = java.predicate(function(t) return filter(t) ~= false end)
    end

    local entities = location.getWorld()
        .getNearbyEntities(location, radiusX, radiusY, radiusZ, predicate)

    if fn ~= nil then
        for ent in forEach(entities) do
            fn(ent)
        end
    else
        return forEach(entities)
    end
end

---@param location bukkit.Location|bukkit.Entity
---@param radius number|bukkit.tVec6
---@param filter? fun(ent: bukkit.entity.LivingEntity): nil|false|boolean
---@param fn? fun(ent: bukkit.entity.LivingEntity)
function bukkit.nearbyLivingEntities(location, radius, filter, fn)
    return bukkit.nearbyEntities(location, radius, function(ent)
        if not bukkit.isLivingEntity(ent) then return false end ---@cast ent bukkit.entity.LivingEntity
        if filter then return filter(ent) end
    end, fn)
end

---@param location bukkit.Location|bukkit.Entity
---@param radius number|bukkit.tVec6
---@param filter? fun(p: bukkit.entity.Player): nil|false|boolean
---@param fn? fun(p: bukkit.entity.Player)
function bukkit.nearbyPlayers(location, radius, filter, fn)
    return bukkit.nearbyEntities(location, radius, function(ent)
        if not bukkit.isPlayer(ent) then return false end ---@cast ent bukkit.entity.Player
        if filter then return filter(ent) end
    end, fn)
end
