local FixedMetadataValue = import("org.bukkit.metadata.FixedMetadataValue")


---@class bukkit.metadata.MetadataValue : java.Object
---@field value fun(): any?
---@field asInt fun(): integer
---@field asFloat fun(): java.float
---@field asDouble fun(): number
---@field asLong fun(): java.long
---@field asShort fun(): java.short
---@field asByte fun(): java.byte
---@field asBoolean fun(): boolean
---@field asString fun(): string
---@field getOwningPlugin fun(): java.Object?
---@field invalidate fun()

---@class bukkit.metadata.Metadatable : java.Object
---@field setMetadata fun(key: string, value: bukkit.metadata.MetadataValue)
---@field getMetadata fun(key: string): java.List<bukkit.metadata.MetadataValue>
---@field hasMetadata fun(key: string): boolean
---@field removeMetadata fun(key: string, owningPlugin: java.Object)

---@param value any?
---@return bukkit.metadata.MetadataValue
function bukkit.fixedMetadataValue(value)
    return FixedMetadataValue(bukkit.platform, value)
end

---@param entity bukkit.Entity
---@param key string
---@return boolean
function bukkit.hasEntityMetadata(entity, key)
    return entity.hasMetadata(key)
end

---@param entity bukkit.Entity
---@param key string
---@return any
function bukkit.getEntityMetadata(entity, key)
    for entry in forEach(entity.getMetadata(key)) do
        return entry.value()
    end
end

---@param entity bukkit.Entity
---@param key string
---@param value any
function bukkit.setEntityMetadata(entity, key, value)
    entity.setMetadata(key, FixedMetadataValue(bukkit.platform, value))
end

---@param entity bukkit.Entity
---@param key string
function bukkit.removeEntityMetadata(entity, key)
    entity.removeMetadata(key, bukkit.platform)
end
