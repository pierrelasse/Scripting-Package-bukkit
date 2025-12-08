local EntityType = import("org.bukkit.entity.EntityType")


---@param v bukkit.EntityType|any
function bukkit.isEntityType(v) return instanceof(v, EntityType) end

---@param id bukkit.NamespacedKeyLike|bukkit.EntityType*|bukkit.EntityType
---@return bukkit.EntityType?
function bukkit.entityType(id)
    if bukkit.isEntityType(id) then ---@cast id bukkit.EntityType
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.EntityType*
    if type(id) == "string" then
        local v = EntityType.fromName(id)
        if v then return v end
    end
    return bukkit.registry.ENTITY_TYPE.get(bukkit.nsk(id))
end
