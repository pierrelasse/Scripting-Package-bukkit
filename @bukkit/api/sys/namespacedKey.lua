local NamespacedKey = import("org.bukkit.NamespacedKey")


---@alias bukkit.NamespacedKeyLike adventure.key.Key|adventure.key.Keyed|bukkit.NamespacedKey|string

---@param v any
function bukkit.isNamespacedKey(v) return instanceof(v, NamespacedKey) end

---@param v bukkit.NamespacedKeyLike
---@return bukkit.NamespacedKey
function bukkit.nsk(v)
    if adventure then
        if adventure.isKey(v) then ---@cast v adventure.key.Key
            return NamespacedKey(v.namespace(), v.key())
        end
        if adventure.isKeyed(v) then ---@cast v adventure.key.Keyed
            return bukkit.nsk(v.key())
        end
    end

    if bukkit.isNamespacedKey(v) then ---@cast v bukkit.NamespacedKey
        return v
    end

    if type(v) == "string" then
        return NamespacedKey.fromString(v)
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
