local PersistentDataType = import("org.bukkit.persistence.PersistentDataType")


---@param name bukkit.persistence.DataType*|bukkit.persistence.DataType
---@return bukkit.persistence.DataType
function bukkit.persistentDataType(name)
    if type(name) ~= "string" then return name end
    return PersistentDataType[name]
end
