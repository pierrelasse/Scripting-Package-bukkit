--#region PotionEffect
local PotionEffect = import("org.bukkit.potion.PotionEffect")

---@deprecated
---@param potionType bukkit.PotionEffectType*|bukkit.PotionEffectType
---@param duration? integer `-1` for infinite. Measured in ticks.
---@param amplifier? integer=`0` 0 = level 1.
---@param ambient? boolean=`false`
---@param particles? boolean=`true`
---@param icon? boolean=`particles`
---@return bukkit.PotionEffect
function bukkit.potionEffect(potionType, duration, amplifier, ambient, particles, icon)
    scripting.warningDeprecated("bukkit.potionEffect")
    if duration == nil then duration = -1 end
    if amplifier == nil then amplifier = 0 end
    if ambient == nil then ambient = false end
    if particles == nil then particles = true end
    if icon == nil then icon = particles end
    return PotionEffect(
        bukkit.potionEffectType(potionType),
        duration,
        amplifier,
        ambient,
        particles,
        icon
    )
end

--#region Builder

---@class bukkit.PotionEffectBuilder
---@field protected _type bukkit.PotionEffectType
---@field protected _amplifier? integer
---@field protected _duration? integer
---@field protected _ambient? boolean
---@field protected _particles? boolean
---@field protected _icon? boolean
local PotionEffectBuilder = {}
PotionEffectBuilder.__index = PotionEffectBuilder

function PotionEffectBuilder:clone()
    return setmetatable(table.clone(self), PotionEffectBuilder)
end

---@return bukkit.PotionEffect
function PotionEffectBuilder:build()
    local duration = self._duration
    if duration == nil then duration = -1 end

    local amplifier = self._amplifier
    if amplifier == nil then amplifier = 0 end

    local ambient = self._ambient
    if ambient == nil then ambient = false end

    local particles = self._particles
    if particles == nil then particles = true end

    local icon = self._icon
    if icon == nil then icon = particles end

    return PotionEffect(
        self._type,
        duration,
        amplifier,
        ambient,
        particles,
        icon
    )
end

---@param entity bukkit.entity.LivingEntity
function PotionEffectBuilder:addToEntity(entity)
    entity.addPotionEffect(self:build())
end

---A higher amplifier means the potion effect happens more often over<br>
---its duration and in some cases has more effect on its target.
---@param v integer 0-based
---@return self
function PotionEffectBuilder:amplifier(v)
    self._amplifier = v
    return self
end

function PotionEffectBuilder:level(v)
    return PotionEffectBuilder:amplifier(v - 1)
end

---@param v integer
---@return self
function PotionEffectBuilder:duration(v)
    self._duration = v
    return self
end

---Makes potion effect produce more, translucent, particles.
---#default(false)
---@param v boolean?
---@return self
function PotionEffectBuilder:ambient(v)
    self._ambient = v
    return self
end

---#default(true)
---@param v boolean?
---@return self
function PotionEffectBuilder:particles(v)
    self._particles = v
    return self
end

---#default(self._particles)
---@param v boolean?
---@return self
function PotionEffectBuilder:icon(v)
    self._icon = v
    return self
end

---@param id bukkit.PotionEffectTypeLike
function bukkit.potionEffectBuilder(id)
    return setmetatable({ _type = bukkit.potionEffectType(id) }, PotionEffectBuilder)
end

--#endregion

--#endregion

--#region PotionEffectType
local PotionEffectType = import("org.bukkit.potion.PotionEffectType")

---@param v bukkit.PotionEffectType|any
function bukkit.isPotionEffectType(v) return instanceof(v, PotionEffectType) end

---@param id bukkit.PotionEffectTypeLike
---@return bukkit.PotionEffectType?
function bukkit.potionEffectType(id)
    if bukkit.isPotionEffectType(id) then ---@cast id bukkit.PotionEffectType
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.EntityType*
    return bukkit.registry.MOB_EFFECT.get(bukkit.nsk(id))
end

--#endregion

--#region PotionData
local PotionData = import("org.bukkit.potion.PotionData")

---@deprecated
---@return java.Object
function bukkit.potionData(type, extended, upgraded)
    scripting.warningDeprecated("bukkit.potionData")
    if extended == nil then extended = true end
    if upgraded == nil then upgraded = true end
    return PotionData(
        bukkit.potionType(type),
        extended,
        upgraded
    )
end

--#endregion

--#region PotionType
local PotionType = import("org.bukkit.potion.PotionType")

---@param v bukkit.PotionType|any
function bukkit.isPotionType(v) return instanceof(v, PotionType) end

---@param id bukkit.PotionTypeLike
---@return bukkit.PotionType?
function bukkit.potionType(id)
    if bukkit.isPotionType(id) then ---@cast id bukkit.PotionType
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.PotionType*
    if type(id) == "string" and not id:contains(":") then
        id = id:lower()
    end
    return bukkit.registry.POTION.get(bukkit.nsk(id))
end

--#endregion
