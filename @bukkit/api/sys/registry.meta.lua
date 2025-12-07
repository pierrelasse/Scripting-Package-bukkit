---@class bukkit.registry.RegistryAware : java.Object
---@field getKeyOrThrow bukkit.NamespacedKey
---@field getKeyOrNull bukkit.NamespacedKey?
---@field isRegistered fun(): boolean

---@class bukkit.Registry<T> : java.Object, {
--- get: fun(key: bukkit.NamespacedKey): T?;
--- getOrThrow: fun(key: bukkit.NamespacedKey): T;
--- match: fun(input: string): T;
---}, java.Iterable<T>
