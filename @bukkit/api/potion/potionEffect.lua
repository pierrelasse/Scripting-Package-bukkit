local PotionEffect = import("org.bukkit.potion.PotionEffect")
local PotionEffectType = import("org.bukkit.potion.PotionEffectType")


---@alias bukkit.PotionEffectType* string
---| "SPEED"
---| "SLOWNESS"
---| "HASTE"
---| "MINING_FATIGUE"
---| "STRENGTH"
---| "INSTANT_HEALTH"
---| "INSTANT_DAMAGE"
---| "JUMP_BOOST"
---| "NAUSEA"
---| "REGENERATION"
---| "RESISTANCE"
---| "FIRE_RESISTANCE"
---| "WATER_BREATHING"
---| "INVISIBILITY"
---| "BLINDNESS"
---| "NIGHT_VISION"
---| "HUNGER"
---| "WEAKNESS"
---| "POISON"
---| "WITHER"
---| "HEALTH_BOOST"
---| "ABSORPTION"
---| "SATURATION"
---| "GLOWING"
---| "LEVITATION"
---| "LUCK"
---| "UNLUCK"
---| "SLOW_FALLING"
---| "CONDUIT_POWER"
---| "DOLPHINS_GRACE"
---| "BAD_OMEN"
---| "HERO_OF_THE_VILLAGE"
---| "DARKNESS"
---| "TRIAL_OMEN"
---| "RAID_OMEN"
---| "WIND_CHARGED"
---| "WEAVING"
---| "OOZING"
---| "INFESTED"

---@class bukkit.PotionEffectType : java.Object
---@field isInstant fun(): boolean
---@field getCategory fun(): java.Object
---@field getColor fun(): bukkit.Color*
---@field getKeyOrThrow fun(): bukkit.NamespacedKey

---@param name bukkit.PotionEffectType*|bukkit.PotionEffectType
---@return bukkit.PotionEffectType
function bukkit.potionEffectType(name)
    if type(name) ~= "string" then return name end
    return PotionEffectType.getByName(name)
end

---bukkit.potion.PotionEffect
---@class bukkit.PotionEffect : java.Object

---@param potionType bukkit.PotionEffectType*|bukkit.PotionEffectType
---@param duration? integer `-1` for infinite. Measured in ticks.
---@param amplifier? integer=`0` 0 = level 1. The amplifier of this effect. A higher amplifier means the potion effect happens more often over its duration and in some cases has more effect on its target.
---@param ambient? boolean=`false` Makes potion effect produce more, translucent, particles.
---@param particles? boolean=`true`
---@param icon? boolean=`particles`
---@return bukkit.PotionEffect
function bukkit.potionEffect(potionType, duration, amplifier, ambient, particles, icon)
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
