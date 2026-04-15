local NamespacedKey = import("org.bukkit.NamespacedKey")


---@param v any
function bukkit.isNamespacedKey(v) return instanceof(v, NamespacedKey) end

---@param v bukkit.NamespacedKeyLike
---@return bukkit.NamespacedKey
function bukkit.nsk(v)
    if adventure then
        if adventure.isKey(v) then ---@cast v adventure.key.Key
            return NamespacedKey(v.namespace(), v.value())
        end
        if adventure.isKeyed(v) then ---@cast v adventure.key.Keyed
            return bukkit.nsk(v.key())
        end
    end

    if bukkit.isNamespacedKey(v) then ---@cast v bukkit.NamespacedKey
        return v
    end

    if type(v) == "string" then
        local key = NamespacedKey.fromString(v)
        if key == nil then error("creating key from '"..v.."'") end
        return key
    end

    error()
end

---@param value string|bukkit.NamespacedKey
---@return bukkit.NamespacedKey
function bukkit.nskM(value)
    if type(value) ~= "string" then return value end
    return NamespacedKey.minecraft(value)
end

---@deprecated
bukkit.namespacedKeyMinecraft = bukkit.nskM

---@param value string|bukkit.NamespacedKey
---@param namespace? (string|"minecraft")|java.Object=`bukkit.platform` Plugin
---@return bukkit.NamespacedKey
function bukkit.namespacedKey(value, namespace)
    if type(value) ~= "string" then return value end
    return NamespacedKey(namespace or bukkit.platform, value)
end

---@param id any
---@param class java.Enum
---@return unknown?
function bukkit._valueFromEnum(id, class)
    if type(id) == "string" and id:startsWith("minecraft:") then
        -- TODO: error handling
        return class.valueOf(id:sub(10):upper())
    end
end
