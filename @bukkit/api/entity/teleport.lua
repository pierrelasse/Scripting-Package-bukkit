local TeleportCause = import("org.bukkit.event.player.PlayerTeleportEvent$TeleportCause")


---@param id bukkit.entity.teleport.TeleportCause*|bukkit.entity.teleport.TeleportCause
---@return bukkit.entity.teleport.TeleportCause?
function bukkit.teleportCause(id)
    if type(id) ~= "string" then return id end
    return TeleportCause.valueOf(id:upper()) -- TODO: error
end

if bukkit.isPaper then
    local TeleportFlag = import("io.papermc.paper.entity.TeleportFlag")
    local TeleportFlag_Relative = import("io.papermc.paper.entity.TeleportFlag$Relative")
    local TeleportFlag_EntityState = import("io.papermc.paper.entity.TeleportFlag$EntityState")

    ---#paper
    ---@param id bukkit.entity.teleport.TeleportFlag*|bukkit.entity.teleport.TeleportFlag
    ---@return bukkit.entity.teleport.TeleportFlag?
    function bukkit.teleportFlag(id)
        if type(id) ~= "string" then return id end
        local parts = id:split("/", 2)
        if parts[1] == "relative" then
            return TeleportFlag_Relative.valueOf(parts[2]:upper())    -- TODO: error
        elseif parts[1] == "entityState" then
            return TeleportFlag_EntityState.valueOf(parts[2]:upper()) -- TODO: error
        else
            error("unknown first part '"..parts[1].."'")
        end
    end

    ---@param list? (bukkit.entity.teleport.TeleportFlag*|bukkit.entity.teleport.TeleportFlag?)[]
    ---@return java.array<bukkit.entity.teleport.TeleportFlag>
    function bukkit.teleportFlagsArr(list)
        if type(list) ~= "table" then return arrays.create(TeleportFlag, 0) end
        local arr = arrays.fromTable(list)
        arr = arrays.mapped(
            arr,
            function(e) return bukkit.teleportFlag(e) end
        ) ---@cast arr java.array<bukkit.entity.teleport.TeleportFlag?>
        arr = arrays.filter(
            arr,
            function(e) return e ~= nil end
        ) ---@cast arr java.array<bukkit.entity.teleport.TeleportFlag>
        return arr
    end
end

--TODO
---@generic E : bukkit.Entity
---@param entity E
---@param location bukkit.Location
---@param callback? fun(entity: E) called after the entity is teleported
function bukkit.teleportSync(entity, location, callback) ---@cast entity bukkit.Entity
    if bukkit.isFolia then error("can't teleport entities asynchronously") end
    entity.teleport(location)
    if callback ~= nil then callback(entity) end -- TODO
end

--TODO
---@generic E : bukkit.Entity
---@param entity E
---@param location bukkit.Location
---@param callback? fun(ent: E, success: boolean) called after the entity is teleported
---@param cause? bukkit.entity.teleport.TeleportCause=`plugin`
---@param flags? (nil|bukkit.entity.teleport.TeleportFlag*|bukkit.entity.teleport.TeleportFlag)[]
function bukkit.teleport(entity, location, callback, cause, flags) ---@cast entity bukkit.Entity
    if bukkit.isPaper then
        if callback ~= nil then
            entity.teleportAsync(
                location,
                cause or bukkit.teleportCause("plugin"),
                bukkit.teleportFlagsArr(flags)
            )
                .thenAccept(java.consumer(function(success)
                    callback(entity, success)
                end))
            return
        end
        if bukkit.isFolia then error("can't teleport entities asynchronously") end
    end
    entity.teleport(location)
    if callback ~= nil then callback(entity, true) end
end

--TODO
---@generic E : bukkit.Entity
---@param entities E[]|java.array<E>|java.Collection<E>|java.List<E>|java.Set<E>
---@param location bukkit.Location
---@param callback? fun(ent: E) called after the entities are teleported
function bukkit.teleportMult(entities, location, callback)
    ---@type fun(): bukkit.Entity
    local itr = type(entities) == "table"
        and table.valuesLoop(entities)
        or forEach(entities)

    local queued = 0
    for ent in itr do
        if ent.isValid() then
            queued = queued + 1
            bukkit.teleport(ent, location, function()
                queued = queued - 1
                if queued == 0 then
                    if callback then
                        callback(ent)
                        callback = nil
                    end
                end
            end)
        end
    end
end
