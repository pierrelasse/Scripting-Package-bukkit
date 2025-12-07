--#region Spawn

---Spawns a entity.
---@generic T : bukkit.Entity
---@param location bukkit.Location
---@param entityType bukkit.EntityType*|java.Class<T>
---@param randomizeData? boolean=`false` whether or not the entity's data should be randomised before spawning. By default entities are randomised before spawning in regards to their equipment, age, attributes, etc. An example of this randomization would be the color of a sheep, random enchantments on the equipment of mobs or even a zombie becoming a chicken jockey. If set to false, the entity will not be randomised before spawning, meaning all their data will remain in their default state and not further modifications to the entity will be made. Notably only entities that extend the org. bukkit. entity. `Mob` interface provide randomisation logic for their spawn. This parameter is hence useless for any other type of entity.
---@return T
function bukkit.spawn(location, entityType, randomizeData)
    if type(entityType) == "string" then
        entityType = bukkit.entityType(entityType).getEntityClass()
    end
    if randomizeData == nil then randomizeData = false end
    return location.getWorld()
        .spawn(
            location,
            entityType,
            randomizeData,
            nil
        )
end

---@param location bukkit.Location
---@param itemStack bukkit.ItemStack
---@param naturally? boolean=`false`
---@return bukkit.entity.Item
function bukkit.spawnItem(location, itemStack, naturally)
    if naturally == true then
        return location.getWorld()
            .dropItemNaturally(location, itemStack)
    else
        return location.getWorld()
            .dropItem(location, itemStack)
    end
end

---@param location bukkit.Location
---@param direction bukkit.Vector
---@param speed number speed of the arrow. A recommend speed is 0.6
---@param spread number spread of the arrow. A recommend spread is 12
---@param clazz? java.class the Entity class for the arrow `org.bukkit.entity.SpectralArrow`, `org.bukkit.entity.TippedArrow`
---@return bukkit.entity.AbstractArrow
function bukkit.spawnArrow(location, direction, speed, spread, clazz)
    if clazz == nil then
        return location.getWorld()
            .spawnArrow(location, direction, speed, spread)
    else
        return location.getWorld()
            .spawnArrow(location, direction, speed, spread, clazz)
    end
end

---@param source bukkit.Location|bukkit.projectiles.ProjectileSource
---@param type bukkit.EntityType|bukkit.EntityType*
---@param velocity? bukkit.Vector
function bukkit.spawnProjectile(source, type, velocity)
    return source.launchProjectile(
        bukkit.entityType(type).getEntityClass(),
        velocity
    )
end

---@param location bukkit.Location
---@param data java.Object  org.bukkit.material.MaterialData|org.bukkit.block.data.BlockData
function bukkit.spawnFallingBlock(location, data)
    return location.getWorld()
        .spawnFallingBlock(location, data)
end

---@param location bukkit.Location
---@param particle bukkit.Particle|java.Object
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

---@param location bukkit.Location
---@param damage? boolean if the lightning should do damage
---@return bukkit.entity.LightningStrike
function bukkit.spawnLightning(location, damage)
    if damage ~= false then
        return location.getWorld()
            .strikeLightning(location)
    else
        return location.getWorld()
            .strikeLightningEffect(location)
    end
end

---@param location bukkit.Location
---@param power? number=`4` The power of explosion, where 4 is TNT
---@param fire? boolean=`false` Whether or not to set blocks on fire
---@param breakBlocks? boolean=`true`
---@param source? bukkit.Entity the source entity, used for tracking damage
---@return boolean # if the explosion was cancelled
function bukkit.spawnExplosion(location, power, fire, breakBlocks, source)
    if power == nil then power = 4 end
    if fire == nil then fire = false end
    if breakBlocks == nil then breakBlocks = true end
    return location.getWorld().createExplosion(
        location.getX(), location.getY(), location.getZ(),
        power,
        fire,
        breakBlocks,
        source
    )
end

--#endregion

---Plays an effect to all players within a default radius around a given location.
---@param location bukkit.Location
---@param effect bukkit.Effect*|java.Object
---@param data? java.Object|integer a data bit needed for some effects
---@param radius? integer=`64` the radius around the location
function bukkit.playEffect(location, effect, data, radius)
    if radius == nil then radius = 64 end
    location.getWorld()
        .playEffect(
            location,
            effect,
            data,
            radius
        )
end

---@param target bukkit.Location|bukkit.Entity
---@param sound string|java.Object
---@param volume number?=`1`
---@param pitch number?=`1`
---@param category? bukkit.SoundCategory|java.Object
---@param seed? integer
function bukkit.playSound(target, sound, volume, pitch, category, seed)
    if volume == nil then volume = 1 end
    if pitch == nil then pitch = 1 end
    if category == nil then category = "MASTER" end

    local args = {
        target,
        sound,
        bukkit.soundCategory(category),
        volume,
        pitch
    }
    if seed ~= nil then
        table.insert(args, seed)
    end

    local func
    if bukkit.isPlayer(target) then
        func = target.playSound
    else
        func = target.getWorld().playSound
    end
    ---@cast func function
    func(table.unpack(args))
end
