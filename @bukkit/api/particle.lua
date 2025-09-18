local Particle = import("org.bukkit.Particle")
local Particle_DustOptions = import("org.bukkit.Particle$DustOptions")
local Particle_DustTransition = import("org.bukkit.Particle$DustTransition")


---@alias bukkit.Particle string
---| "POOF"
---| "EXPLOSION"
---| "EXPLOSION_EMITTER"
---| "FIREWORK"
---| "BUBBLE"
---| "SPLASH"
---| "FISHING"
---| "UNDERWATER"
---| "CRIT"
---| "ENCHANTED_HIT"
---| "SMOKE"
---| "LARGE_SMOKE"
---| "EFFECT"
---| "INSTANT_EFFECT"
---| "ENTITY_EFFECT" Color
---| "WITCH"
---| "DRIPPING_WATER"
---| "DRIPPING_LAVA"
---| "ANGRY_VILLAGER"
---| "HAPPY_VILLAGER"
---| "MYCELIUM"
---| "NOTE"
---| "PORTAL"
---| "ENCHANT"
---| "FLAME"
---| "LAVA"
---| "CLOUD"
---| "DUST" DustOptions
---| "ITEM_SNOWBALL"
---| "ITEM_SLIME"
---| "HEART"
---| "ITEM" ItemStack
---| "BLOCK" BlockData
---| "RAIN"
---| "ELDER_GUARDIAN"
---| "DRAGON_BREATH"
---| "END_ROD"
---| "DAMAGE_INDICATOR"
---| "SWEEP_ATTACK"
---| "FALLING_DUST" BlockData
---| "TOTEM_OF_UNDYING"
---| "SPIT"
---| "SQUID_INK"
---| "BUBBLE_POP"
---| "CURRENT_DOWN"
---| "BUBBLE_COLUMN_UP"
---| "NAUTILUS"
---| "DOLPHIN"
---| "SNEEZE"
---| "CAMPFIRE_COSY_SMOKE"
---| "CAMPFIRE_SIGNAL_SMOKE"
---| "COMPOSTER"
---| "FLASH"
---| "FALLING_LAVA"
---| "LANDING_LAVA"
---| "FALLING_WATER"
---| "DRIPPING_HONEY"
---| "FALLING_HONEY"
---| "LANDING_HONEY"
---| "FALLING_NECTAR"
---| "SOUL_FIRE_FLAME"
---| "ASH"
---| "CRIMSON_SPORE"
---| "WARPED_SPORE"
---| "SOUL"
---| "DRIPPING_OBSIDIAN_TEAR"
---| "FALLING_OBSIDIAN_TEAR"
---| "LANDING_OBSIDIAN_TEAR"
---| "REVERSE_PORTAL"
---| "WHITE_ASH"
---| "DUST_COLOR_TRANSITION" DustTransition
---| "VIBRATION" Vibration
---| "FALLING_SPORE_BLOSSOM"
---| "SPORE_BLOSSOM_AIR"
---| "SMALL_FLAME"
---| "SNOWFLAKE"
---| "DRIPPING_DRIPSTONE_LAVA"
---| "FALLING_DRIPSTONE_LAVA"
---| "DRIPPING_DRIPSTONE_WATER"
---| "FALLING_DRIPSTONE_WATER"
---| "GLOW_SQUID_INK"
---| "GLOW"
---| "WAX_ON"
---| "WAX_OFF"
---| "ELECTRIC_SPARK"
---| "SCRAPE"
---| "SONIC_BOOM"
---| "SCULK_SOUL"
---| "SCULK_CHARGE" Float
---| "SCULK_CHARGE_POP"
---| "SHRIEK" Integer
---| "CHERRY_LEAVES"
---| "PALE_OAK_LEAVES"
---| "EGG_CRACK"
---| "DUST_PLUME"
---| "WHITE_SMOKE"
---| "GUST"
---| "SMALL_GUST"
---| "GUST_EMITTER_LARGE"
---| "GUST_EMITTER_SMALL"
---| "TRIAL_SPAWNER_DETECTION"
---| "TRIAL_SPAWNER_DETECTION_OMINOUS"
---| "VAULT_CONNECTION"
---| "INFESTED"
---| "ITEM_COBWEB"
---| "DUST_PILLAR" BlockData
---| "BLOCK_CRUMBLE" BlockData
---| "TRAIL" Trail
---| "OMINOUS_SPAWNING"
---| "RAID_OMEN"
---| "TRIAL_OMEN"
---| "BLOCK_MARKER" BlockData

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
