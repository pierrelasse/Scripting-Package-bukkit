local NamespacedKey = import("org.bukkit.NamespacedKey")


---org.bukkit.NamespacedKey
---@class bukkit.NamespacedKey : java.Object
---@field asString fun(): string
---@field getKey fun(): string
---@field getNamespace fun(): string

---@param key string|bukkit.NamespacedKey
---@param namespace? (string|"minecraft")|java.Object Plugin
---@return bukkit.NamespacedKey
function bukkit.namespacedKey(key, namespace)
    if type(key) ~= "string" then return key end
    return NamespacedKey(namespace or bukkit.platform, key)
end

---@param o any
function bukkit.isNamespacedKey(o)
    return instanceof(o, NamespacedKey)
end
