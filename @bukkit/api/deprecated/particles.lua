local Particle_DustOptions = import("org.bukkit.Particle$DustOptions")
local Particle_DustTransition = import("org.bukkit.Particle$DustTransition")


---@deprecated
---@param color bukkit.ColorLike
---@param size? number=`1`
---@return bukkit.Particle.DustOptions
function bukkit.particleDustOptions(color, size)
    return Particle_DustOptions(
        bukkit.color(color),
        size or 1
    )
end

---@deprecated
---@param fromColor bukkit.ColorLike
---@param toColor bukkit.ColorLike
---@param size? number=`1`
---@return bukkit.Particle.DustTransition
function bukkit.particleDustTransition(fromColor, toColor, size)
    return Particle_DustTransition(
        bukkit.color(fromColor),
        bukkit.color(toColor),
        size or 1
    )
end

---@deprecated
---@param location bukkit.Location
---@param particle bukkit.Particle*|bukkit.Particle
---@param options? {
---count?: integer; --=`1` the number of particles
---offset?: { [1]: number; [2]: number; [3]: number; }; --=`{ 0, 0, 0 }` { x, y, z } the maximum random offset
---extra?: number; --=`0` the extra data for this particle, depends on the particle used (normally speed)
---data?: java.Object?; -- the data to use for the particle or null, the type of this depends on `Particle.getDataType()`
---force?: boolean; --=`false` whether to send the particle to players within an extended range and encourage their client to render it regardless of settings
---}
function bukkit.spawnParticle(location, particle, options)
    local x, y, z = location.getX(), location.getY(), location.getZ()

    if options == nil then options = {} end

    local count = default(options.count, 1)

    local offsetX, offsetY, offsetZ
    if options.offset ~= nil then
        offsetX = options.offset[1]
        offsetY = options.offset[2]
        offsetZ = options.offset[3]
    end
    if offsetX == nil then offsetX = 0 end
    if offsetY == nil then offsetY = 0 end
    if offsetZ == nil then offsetZ = 0 end

    local extra = default(options.extra, 0)

    local data = options.data

    local force = default(options.force, false)

    location.getWorld().spawnParticle(
        bukkit.particle(particle),
        x, y, z,
        count,
        offsetX, offsetY, offsetZ,
        extra,
        data,
        force
    )
end
