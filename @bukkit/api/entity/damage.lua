--#region DamageType
local DamageType = import("org.bukkit.damage.DamageType")

---@param v bukkit.DamageType|any
function bukkit.isDamageType(v) return instanceof(v, DamageType) end

---@param id bukkit.DamageTypeLike
---@return bukkit.DamageType?
function bukkit.damageType(id)
    if bukkit.isDamageType(id) then ---@cast id bukkit.DamageType
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.DamageType*
    if type(id) == "string" and not id:contains(":") then
        id = id:lower()
    end
    return bukkit.registry.DAMAGE_TYPE.get(bukkit.nsk(id))
end

--#endregion

--#region DamageSource
local DamageSource = import("org.bukkit.damage.DamageSource")

---@class bukkit.DamageSourceBuilder
---@field private _b java.Object
local DamageSourceBuilder = {}
DamageSourceBuilder.__index = DamageSourceBuilder

function DamageSourceBuilder:clone()
    return setmetatable(table.clone(self), DamageSourceBuilder)
end

---@return bukkit.DamageSource
function DamageSourceBuilder:build()
    return self._b.build()
end

---@param entity bukkit.entity.Damageable
---@param amount number
function DamageSourceBuilder:damage(entity, amount)
    bukkit.damage(entity, amount, self:build())
end

---**Direct entity has to be set!**
---@param entity bukkit.Entity
---@return self
function DamageSourceBuilder:causingEntity(entity)
    self._b.withCausingEntity(entity)
    return self
end

---@deprecated
DamageSourceBuilder.withCausingEntity = DamageSourceBuilder.causingEntity

---Set the Entity that directly inflicted the damage.
---@param entity bukkit.Entity
---@return self
function DamageSourceBuilder:directEntity(entity)
    self._b.withDirectEntity(entity)
    return self
end

---@deprecated
DamageSourceBuilder.withDirectEntity = DamageSourceBuilder.directEntity

---@param location bukkit.Location
---@return self
function DamageSourceBuilder:damageLocation(location)
    self._b.withDamageLocation(location)
    return self
end

---@deprecated
DamageSourceBuilder.withDamageLocation = DamageSourceBuilder.damageLocation

---@param damageType bukkit.DamageTypeLike
function bukkit.damageSource(damageType)
    return setmetatable({ _b = DamageSource.builder(bukkit.damageType(damageType) or error()) }, DamageSourceBuilder)
end

--#endregion

---Deals the given amount of damage to the target entity.
---@param target bukkit.entity.Damageable
---@param amount number health-points
---@param source? bukkit.Entity|java.Object org.bukkit.damage.DamageSource
function bukkit.damage(target, amount, source)
    if source == nil then
        target.damage(amount)
    else
        target.damage(amount, source)
    end
end
