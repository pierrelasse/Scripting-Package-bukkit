local Particle = import("org.bukkit.Particle")
local Particle_DustOptions = import("org.bukkit.Particle$DustOptions")
local Particle_DustTransition = import("org.bukkit.Particle$DustTransition")


---@param name bukkit.Particle|java.Object
---@return java.Object
function bukkit.particle(name)
    if type(name) ~= "string" then return name end
    return Particle[name]
end

---Options which can be applied to redstone dust particles - a particle color and size.
---@param color bukkit.Color color of the displayed particles
---@param size number size of the particle
---@return java.Object options org.bukkit.Particle$DustOptions
function bukkit.particleDustOptions(color, size)
    return Particle_DustOptions(
        color,
        size
    )
end

---Options which can be applied to a color transitioning dust particles.
---@param fromColor bukkit.Color
---@param toColor bukkit.Color
---@param size number
function bukkit.particleDustTransition(fromColor, toColor, size)
    return Particle_DustTransition(
        fromColor,
        toColor,
        size
    )
end
