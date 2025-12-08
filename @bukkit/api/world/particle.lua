local Color = import("org.bukkit.Color")
local Particle = import("org.bukkit.Particle")
local Particle_DustOptions = import("org.bukkit.Particle$DustOptions")
local Particle_DustTransition = import("org.bukkit.Particle$DustTransition")
local Particle_Trail = import("org.bukkit.Particle$Trail")


---@param v bukkit.Particle|any
function bukkit.isParticle(v) return instanceof(v, Particle) end

---@param id bukkit.NamespacedKeyLike|bukkit.Particle*|bukkit.Particle
---@return bukkit.Particle?
function bukkit.particle(id)
    if bukkit.isParticle(id) then ---@cast id bukkit.Particle
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.Particle*
    if type(id) == "string" and not id:contains(":") then
        local v = java.enumValueOf(Particle, id)
        if v then return v end
    end
    return bukkit.registry.PARTICLE_TYPE.get(bukkit.nsk(id))
end

--#region ParticleBuilder

---@class bukkit.ParticleBuilder
---@field protected _particle? bukkit.Particle
---@field protected _receivers? java.List<bukkit.entity.Player>
---@field protected _source? bukkit.entity.Player
---@field protected _location? bukkit.Location
local ParticleBuilder = {
    ---@protected
    ---@type integer
    _count = 0,

    ---@protected
    ---@type number
    _offsetX = 0,
    ---@protected
    ---@type number
    _offsetY = 0,
    ---@protected
    ---@type number
    _offsetZ = 0,

    ---@protected
    ---@type number
    _extra = 0,

    ---@protected
    ---@type java.Object?
    _data = nil,

    ---@protected
    ---@type boolean
    _force = false
}
ParticleBuilder.__index = ParticleBuilder

function ParticleBuilder:clone()
    return setmetatable(table.clone(self), ParticleBuilder)
end

function ParticleBuilder:spawn()
    local particle = self._particle
    if particle == nil then return end

    local receivers = self._receivers

    local location = self._location
    if location == nil then return end
    local world = self._location.getWorld()
    if world == nil then return end

    local source = self._source
    local count = self._count
    local offsetX = self._offsetX
    local offsetY = self._offsetY
    local offsetZ = self._offsetZ
    local extra = self._extra
    local data = self._data
    local force = self._force

    if bukkit.isPaper then
        world.spawnParticle(
            self._particle,
            self._receivers, source,
            location.getX(), location.getY(), location.getZ(),
            count,
            offsetX, offsetY, offsetZ,
            extra, data, force
        )
    else
        if receivers then
            for receiver in forEach(receivers) do
                receiver.spawnParticle(
                    self._particle,
                    location.getX(), location.getY(), location.getZ(),
                    count,
                    offsetX, offsetY, offsetZ,
                    extra, data, force
                )
            end
        else
            world.spawnParticle(
                self._particle,
                location.getX(), location.getY(), location.getZ(),
                count,
                offsetX, offsetY, offsetZ,
                extra, data, force
            )
        end
    end
end

---@param ... bukkit.entity.Player
---@return self
function ParticleBuilder:receiver(...)
    self._receivers = java.listOf(...)
    return self
end

---@param v java.List<bukkit.entity.Player>|java.array<bukkit.entity.Player>|bukkit.entity.Player[]
---@return self
function ParticleBuilder:receivers(v)
    if type(v) == "table" then
        self._receivers = java.listOf(table.unpack(v))
    elseif arrays.is(v) then
        self._receivers = java.listOf(arrays.unpack(v))
    else
        self._receivers = v
    end
    return self
end

---@return self
function ParticleBuilder:receiversAll()
    self._receivers = nil
    return self
end

---@param v number|bukkit.tVec3|{ distance: number }
---@return self
function ParticleBuilder:receiversNearby(v)
    if self._location then
        self._receivers = bukkit.nearbyPlayersL(self._location, v)
    end
    return self
end

---#paper
---@param v bukkit.entity.Player?
---@return self
function ParticleBuilder:source(v)
    self._source = v
    return self
end

---@param v bukkit.Location?
---@return self
function ParticleBuilder:location(v)
    self._location = v
    return self
end

---@param v integer
---@return self
function ParticleBuilder:count(v)
    self._count = v
    return self
end

---@param x number?
---@param y number?
---@param z number?
---@return self
function ParticleBuilder:offset(x, y, z)
    if x then self._offsetX = x end
    if y then self._offsetY = y end
    if z then self._offsetZ = z end
    return self
end

---@param v number
---@return self
function ParticleBuilder:extra(v)
    self._extra = v
    return self
end

---@param v java.Object?
---@return self
function ParticleBuilder:data(v)
    self._data = v
    return self
end

---@param v? boolean=`true`
---@return self
function ParticleBuilder:force(v)
    if v == nil then v = true end
    self._force = v
    return self
end

---@param color? bukkit.ColorLike
---@param size? java.float=`1`
---@return self
function ParticleBuilder:color(color, size)
    if color == nil then
        self._data = nil
    elseif self._particle then
        if self._particle.getDataType() == Color.class then
            return self:data(bukkit.color(color))
        end
        if self._particle.getDataType() == Particle_DustOptions.class then
            return self:data(Particle_DustOptions(
                bukkit.color(color),
                size or 1
            ))
        end
    end
    return self
end

---@param from bukkit.ColorLike
---@param to bukkit.ColorLike
---@param size? java.float=`1`
function ParticleBuilder:colorTransition(from, to, size)
    if self._particle then
        if self._particle.getDataType() == Particle_DustTransition.class then
            return self:data(Particle_DustTransition(bukkit.color(from), bukkit.color(to), size or 1))
        end
    end
    return self
end

---@param target bukkit.Location
---@param color bukkit.ColorLike
---@param duration integer
function ParticleBuilder:trail(target, color, duration)
    if self._particle then
        if self._particle.getDataType() == Particle_Trail.class then
            return self:data(Particle_Trail(
                target,
                bukkit.color(color),
                duration
            ))
        end
    end
    return self
end

---@param id bukkit.NamespacedKeyLike|bukkit.Particle*|bukkit.Particle
function bukkit.particleBuilder(id)
    return setmetatable({ _particle = bukkit.particle(id) }, ParticleBuilder)
end

--#endregion
