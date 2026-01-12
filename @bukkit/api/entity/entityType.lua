local EntityType = import("org.bukkit.entity.EntityType")


---@param v bukkit.EntityType|any
function bukkit.isEntityType(v) return instanceof(v, EntityType) end

---@param id bukkit.EntityTypeLike
---@return bukkit.EntityType?
function bukkit.entityType(id)
    if bukkit.isEntityType(id) then ---@cast id bukkit.EntityType
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.EntityType*
    if type(id) == "string" and not id:contains(":") then
        if id == "UNKNOWN" then
            return EntityType.UNKNOWN
        else
            id = id:lower()
        end
    end
    return bukkit.registry.ENTITY_TYPE.get(bukkit.nsk(id))
end
