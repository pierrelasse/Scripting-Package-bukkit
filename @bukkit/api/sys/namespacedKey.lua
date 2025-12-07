local NamespacedKey = import("org.bukkit.NamespacedKey")


---@param o any
function bukkit.isNamespacedKey(o) return instanceof(o, NamespacedKey) end

---@param key string|bukkit.NamespacedKey
---@param namespace? (string|"minecraft")|java.Object Plugin
---@return bukkit.NamespacedKey
function bukkit.namespacedKey(key, namespace)
    if type(key) ~= "string" then return key end
    return NamespacedKey(namespace or bukkit.platform, key)
end

---@param key string|bukkit.NamespacedKey
---@return bukkit.NamespacedKey
function bukkit.namespacedKeyMinecraft(key)
    if type(key) ~= "string" then return key end
    return NamespacedKey("minecraft", key)
end
