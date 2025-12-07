local World = import("org.bukkit.World")
local GameRule = import("org.bukkit.GameRule")


---@deprecated
function bukkit.strikeLightning(...)
    scripting.warningDeprecated("bukkit.strikeLightning")
    return bukkit.spawnLightning(...)
end

---@deprecated
function bukkit.createExplosion(...)
    scripting.warningDeprecated("bukkit.createExplosion")
    return bukkit.spawnExplosion(...)
end

---@deprecated
function bukkit.playSoundAt(locationOrPlayer, sound, volume, pitch)
    scripting.warningDeprecated("bukkit.playSoundAt")
    if bukkit.isPlayer(locationOrPlayer) then locationOrPlayer = locationOrPlayer.getLocation() end
    locationOrPlayer.getWorld()
        .playSound(locationOrPlayer, sound, volume or 1, pitch or 1)
end

function bukkit.isWorld(o)
    return instanceof(o, World)
end

--#region Worlds

---@type bukkit.World
bukkit.baseWorld = bukkit.Bukkit.getWorlds().get(0)

function bukkit.defaultWorld()
    return bukkit.baseWorld
end

---@return java.Collection<bukkit.World>
function bukkit.worlds()
    return bukkit.Bukkit.getWorlds()
end

function bukkit.worldsLoop()
    return forEach(bukkit.worlds())
end

--TODO: Might change
---@param s any|string
function bukkit.isValidWorldName(s)
    return type(s) == "string"
        and s:match("[A-Za-z0-9_\\-/]+")
        and numbers.between(#s, 3, 32)
end

---@param name string|bukkit.World Name/id of the world
---@return bukkit.World?
function bukkit.world(name)
    if type(name) ~= "string" then return name end
    return bukkit.Bukkit.getWorld(name)
end

---@param uid java.Object java.util.UUID
---@return bukkit.World?
function bukkit.worldUID(uid)
    return bukkit.Bukkit.getWorld(uid)
end

--#endregion

--#region Configuration

---@param name bukkit.GameRule*|bukkit.GameRule
---@return bukkit.GameRule?
function bukkit.gameRule(name)
    if type(name) ~= "string" then return name end
    return GameRule.getByName(name)
end

--#endregion

--#region Spawn

---Spawns a entity.
---@generic T : bukkit.Entity
---@param location bukkit.Location
---@param type bukkit.EntityType*|java.Class<T>
---@param randomizeData? boolean=`false` whether or not the entity's data should be randomised before spawning. By default entities are randomised before spawning in regards to their equipment, age, attributes, etc. An example of this randomization would be the color of a sheep, random enchantments on the equipment of mobs or even a zombie becoming a chicken jockey. If set to false, the entity will not be randomised before spawning, meaning all their data will remain in their default state and not further modifications to the entity will be made. Notably only entities that extend the org. bukkit. entity. `Mob` interface provide randomisation logic for their spawn. This parameter is hence useless for any other type of entity.
---@return T
function bukkit.spawn(location, type, randomizeData)
    if type(type) == "string" then
        type = bukkit.entityType(type).getEntityClass()
    end
    if randomizeData == nil then randomizeData = false end
    return location.getWorld()
        .spawn(
            location,
            type,
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

--#region Util

---@param location bukkit.Location|bukkit.Entity
---@param radius number|bukkit.tVec6
---@param filter? fun(ent: bukkit.Entity): nil|false|boolean
---@param fn? fun(ent: bukkit.Entity)
function bukkit.nearbyEntities(location, radius, filter, fn)
    if bukkit.isEntity(location) then ---@cast location bukkit.Entity
        location = location.getLocation() ---@cast location bukkit.Location
    end

    ---@type number, number, number
    local radiusX, radiusY, radiusZ
    if type(radius) == "table" then
        radiusX = radius[1]
        radiusY = radius[2]
        radiusZ = radius[3]
    else
        radiusX = radius
        radiusY = radius
        radiusZ = radius
    end

    local predicate ---@type java.Predicate<bukkit.Entity>?
    if filter ~= nil then
        predicate = java.predicate(function(t) return filter(t) ~= false end)
    end

    local entities = location.getWorld()
        .getNearbyEntities(location, radiusX, radiusY, radiusZ, predicate)

    if fn ~= nil then
        for ent in forEach(entities) do
            fn(ent)
        end
    else
        return forEach(entities)
    end
end

---@param location bukkit.Location|bukkit.Entity
---@param radius number|bukkit.tVec6
---@param filter? fun(ent: bukkit.entity.LivingEntity): nil|false|boolean
---@param fn? fun(ent: bukkit.entity.LivingEntity)
function bukkit.nearbyLivingEntities(location, radius, filter, fn)
    return bukkit.nearbyEntities(location, radius, function(ent)
        if not bukkit.isLivingEntity(ent) then return false end ---@cast ent bukkit.entity.LivingEntity
        if filter then return filter(ent) end
    end, fn)
end

---@param location bukkit.Location|bukkit.Entity
---@param radius number|bukkit.tVec6
---@param filter? fun(p: bukkit.entity.Player): nil|false|boolean
---@param fn? fun(p: bukkit.entity.Player)
function bukkit.nearbyPlayers(location, radius, filter, fn)
    return bukkit.nearbyEntities(location, radius, function(ent)
        if not bukkit.isPlayer(ent) then return false end ---@cast ent bukkit.entity.Player
        if filter then return filter(ent) end
    end, fn)
end

--#endregion
