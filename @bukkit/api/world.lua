local ChunkStatus = import("net.minecraft.world.level.chunk.status.ChunkStatus")
local World = import("org.bukkit.World")
local GameRule = import("org.bukkit.GameRule")


---@type bukkit.World
bukkit.baseWorld = bukkit.Bukkit.getWorlds().get(0)

function bukkit.isWorld(o)
    return instanceof(o, World)
end

function bukkit.defaultWorld()
    return bukkit.baseWorld
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

---@param name bukkit.GameRule*|bukkit.GameRule
---@return bukkit.GameRule
function bukkit.gameRule(name)
    if type(name) ~= "string" then return name end
    return GameRule.getByName(name)
end

---Spawns a entity.
---@param location bukkit.Location
---@param clazz bukkit.EntityType*|java.Object Class<T extends Entity> Type of the spawned entity.
---@param randomizeData? boolean=`false` whether or not the entity's data should be randomised before spawning. By default entities are randomised before spawning in regards to their equipment, age, attributes, etc. An example of this randomization would be the color of a sheep, random enchantments on the equipment of mobs or even a zombie becoming a chicken jockey. If set to false, the entity will not be randomised before spawning, meaning all their data will remain in their default state and not further modifications to the entity will be made. Notably only entities that extend the org. bukkit. entity. `Mob` interface provide randomisation logic for their spawn. This parameter is hence useless for any other type of entity.
---@return bukkit.Entity # the spawned entity
function bukkit.spawn(location, clazz, randomizeData)
    if type(clazz) == "string" then
        clazz = bukkit.entityType(clazz).getEntityClass()
    end
    if randomizeData == nil then randomizeData = false end
    return location.getWorld()
        .spawn(
            location,
            clazz,
            randomizeData,
            nil
        )
end

---@param location bukkit.Location
---@param item java.Object org.bukkit.inventory.ItemStack
---@param naturally? boolean
---@return bukkit.entity.Item
function bukkit.spawnItem(location, item, naturally)
    if naturally == true then
        return location.getWorld()
            .dropItemNaturally(location, item)
    else
        return location.getWorld()
            .dropItem(location, item)
    end
end

---@param location bukkit.Location
---@param direction java.Object org.bukkit.util.Vector
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

---@deprecated
function bukkit.strikeLightning(...)
    scripting.warningDeprecated("bukkit.strikeLightning")
    return bukkit.spawnLightning(...)
end

---@param location bukkit.Location
---@param power? number=`4` The power of explosion, where 4 is TNT
---@param fire? boolean=`false` Whether or not to set blocks on fire
---@param breakBlocks? boolean=`true`
---@param source? java.Object the source entity, used for tracking damage
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

---@deprecated
function bukkit.createExplosion(...)
    scripting.warningDeprecated("bukkit.createExplosion")
    return bukkit.spawnExplosion(...)
end

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

---@param target java.Object org.bukkit.Location|org.bukkit.entity.Entity
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

    func(table.unpack(args))
end

---@deprecated
function bukkit.playSoundAt(locationOrPlayer, sound, volume, pitch)
    scripting.warningDeprecated("bukkit.playSoundAt")
    if bukkit.isPlayer(locationOrPlayer) then locationOrPlayer = locationOrPlayer.getLocation() end
    locationOrPlayer.getWorld()
        .playSound(locationOrPlayer, sound, volume or 1, pitch or 1)
end

---Updates neighbors at a specified location.
---@param location bukkit.Location
function bukkit.applyPhysics(location)
    location
        .getWorld()
        .getHandle()
        .updateNeighborsAt(
            bukkit.craft.toBlockPosition(location),
            bukkit.craft.getBlock(location.getBlock().getType())
        )
end

---Performs a randomTick at a specified block location.
---@param location bukkit.Location
function bukkit.doRandomTick(location)
    local blockPos = bukkit.craft.toBlockPosition(location)
    local nmsChunk = location.getChunk().getHandle(ChunkStatus.FULL)
    local nmsBlock = nmsChunk.getBlockState(blockPos)
    local nmsWorld = location.getWorld().getHandle()
    if nmsBlock.isRandomlyTicking() then
        nmsBlock.randomTick(nmsWorld, blockPos, nmsWorld.random)
    end
    local fluid = nmsBlock.getFluidState()
    if fluid.isRandomlyTicking() then
        fluid.animateTick(nmsWorld, blockPos, nmsWorld.random)
    end
end
