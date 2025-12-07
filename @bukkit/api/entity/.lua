local Entity = import("org.bukkit.entity.Entity")
local LivingEntity = import("org.bukkit.entity.LivingEntity")
local Mob = import("org.bukkit.entity.Mob")


---@param v any|bukkit.Entity
function bukkit.isEntity(v) return instanceof(v, Entity) end

---@param v any|bukkit.entity.LivingEntity
function bukkit.isLivingEntity(v) return instanceof(v, LivingEntity) end

---@param v any|bukkit.entity.Mob
function bukkit.isMob(v) return instanceof(v, Mob) end

--TODO
---@param entity bukkit.Entity|any
function bukkit.deleteEntity(entity)
    if bukkit.isEntity(entity) then entity.remove() end
end

--TODO
---@generic E : bukkit.Entity
---@param entity E
---@param location bukkit.Location
---@param callback? fun(entity: E) called after the entity is teleported
function bukkit.teleportSync(entity, location, callback)
    ---@cast entity bukkit.Entity
    entity.teleport(location)
    if callback ~= nil then callback(entity) end -- TODO
end

--TODO
---@generic E : bukkit.Entity
---@param entity E
---@param location bukkit.Location
---@param callback? fun(entity: E) called after the entity is teleported
function bukkit.teleport(entity, location, callback)
    ---@cast entity bukkit.Entity
    entity.teleport(location)
    if callback ~= nil then callback(entity) end -- TODO
end

--TODO
---@generic E : bukkit.Entity
---@param entities E[]|java.array<E>|java.Collection<E>|java.List<E>|java.Set<E>
---@param location bukkit.Location
---@param callback? fun(ent: E) called after the entities are teleported
function bukkit.teleportMult(entities, location, callback)
    ---@type fun(): bukkit.Entity
    local itr = type(entities) == "table"
        and table.valuesLoop(entities)
        or forEach(entities)

    local queued = 0
    for ent in itr do
        if ent.isValid() then
            queued = queued + 1
            bukkit.teleport(ent, location, function()
                queued = queued - 1
                if queued == 0 then
                    if callback then
                        callback(ent)
                        callback = nil
                    end
                end
            end)
        end
    end
end

--TODO
---@param passenger bukkit.Entity
---@param vehicle bukkit.Entity
function bukkit.ride(passenger, vehicle)
    passenger.leaveVehicle()
    vehicle.addPassenger(passenger)
end

--TODO
---@param entity bukkit.Entity
---@param potionEffect bukkit.PotionEffect
function bukkit.addPotionEffect(entity, potionEffect)
    entity.addPotionEffect(potionEffect)
end

--TODO
---@param entity bukkit.Entity
---@param potionEffectType bukkit.PotionEffectType*|bukkit.PotionEffectType
function bukkit.removePotionEffect(entity, potionEffectType)
    entity.removePotionEffect(bukkit.potionEffectType(potionEffectType))
end
