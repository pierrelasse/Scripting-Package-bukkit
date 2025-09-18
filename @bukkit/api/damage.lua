local DamageSource = import("org.bukkit.damage.DamageSource")
local DamageType = import("org.bukkit.damage.DamageType")


---@alias bukkit.DamageType* string
---| "IN_FIRE"
---| "CAMPFIRE"
---| "LIGHTNING_BOLT"
---| "ON_FIRE"
---| "LAVA"
---| "HOT_FLOOR"
---| "IN_WALL"
---| "CRAMMING"
---| "DROWN"
---| "STARVE"
---| "CACTUS"
---| "FALL"
---| "FLY_INTO_WALL"
---| "OUT_OF_WORLD"
---| "GENERIC"
---| "MAGIC"
---| "WITHER"
---| "DRAGON_BREATH"
---| "DRY_OUT"
---| "SWEET_BERRY_BUSH"
---| "FREEZE"
---| "STALAGMITE"
---| "FALLING_BLOCK"
---| "FALLING_ANVIL"
---| "FALLING_STALACTITE"
---| "STING"
---| "MOB_ATTACK"
---| "MOB_ATTACK_NO_AGGRO"
---| "PLAYER_ATTACK"
---| "ARROW"
---| "TRIDENT"
---| "MOB_PROJECTILE"
---| "SPIT"
---| "FIREWORKS"
---| "FIREBALL"
---| "UNATTRIBUTED_FIREBALL"
---| "WITHER_SKULL"
---| "THROWN"
---| "INDIRECT_MAGIC"
---| "THORNS"
---| "EXPLOSION"
---| "PLAYER_EXPLOSION"
---| "SONIC_BOOM"
---| "BAD_RESPAWN_POINT"
---| "OUTSIDE_BORDER"
---| "GENERIC_KILL"

---@param name bukkit.DamageType*|java.Object
---@return java.Object damageType org.bukkit.damage.DamageType
function bukkit.damageType(name)
    if type(name) ~= "string" then return name end
    return DamageType[name]
end

---@param damageType bukkit.DamageType*|java.Object org.bukkit.damage.DamageType
function bukkit.damageSource(damageType)
    local Builder = {
        b = DamageSource.builder(bukkit.damageType(damageType))
    }

    ---Set the Entity that caused the damage.
    ---@param entity bukkit.Entity
    ---@return self
    function Builder:withCausingEntity(entity)
        self.b.withCausingEntity(entity)
        return self
    end

    ---Set the Entity that directly inflicted the damage.
    ---@param entity bukkit.Entity
    ---@return self
    function Builder:withDirectEntity(entity)
        self.b.withDirectEntity(entity)
        return self
    end

    ---Set the Location of the source of damage.
    ---@param location bukkit.Location
    ---@return self
    function Builder:withDamageLocation(location)
        self.b.withDamageLocation(location)
        return self
    end

    ---Create a new DamageSource instance using the supplied parameters.
    ---@return java.Object # org.bukkit.damage.DamageSource
    function Builder:build()
        return self.b.build()
    end

    return Builder
end

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
