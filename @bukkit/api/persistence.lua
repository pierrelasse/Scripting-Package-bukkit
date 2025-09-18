local PersistentDataType = import("org.bukkit.persistence.PersistentDataType")


---@alias bukkit.persistence.DataType* string
---Primitive one value types.
---| "BYTE"
---| "SHORT"
---| "INTEGER"
---| "LONG"
---| "FLOAT"
---| "DOUBLE"
---Boolean.
---| "BOOLEAN"
---String.
---| "STRING"
---Primitive arrays.
---| "BYTE_ARRAY"
---| "INTEGER_ARRAY"
---| "LONG_ARRAY"
---Nested PersistentDataContainer.
---| "TAG_CONTAINER"
---| "LIST"

---org.bukkit.persistence.PersistentDataType
---@class bukkit.persistence.DataType : java.Object
---@field getPrimitiveType fun(): java.Class
---@field getComplexType fun(): java.Class

---@param name bukkit.persistence.DataType*|bukkit.persistence.DataType
---@return bukkit.persistence.DataType
function bukkit.persistentDataType(name)
    if type(name) ~= "string" then return name end
    return PersistentDataType[name]
end

---@class bukkit.persistence.DataContainer : java.Object
---@field set fun(key: bukkit.NamespacedKey, type: bukkit.persistence.DataType, value: any)
---@field has fun(key: bukkit.NamespacedKey, type?: bukkit.persistence.DataType): boolean
---@field get fun(key: bukkit.NamespacedKey, type: bukkit.persistence.DataType): any
---@field getOrDefault fun(key: bukkit.NamespacedKey, type: bukkit.persistence.DataType, defaultValue: any): any
---@field getKeys fun(): java.Set<bukkit.NamespacedKey>
---@field remove fun(key: bukkit.NamespacedKey)
---@field isEmpty fun(): boolean
---@field copyTo fun(other: bukkit.persistence.DataContainer, replace: boolean)

---@class bukkit.persistence.DataHolder : java.Object
---@field getPersistentDataContainer fun(): bukkit.persistence.DataContainer
