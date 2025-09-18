local Art = import("org.bukkit.Art")


---@alias bukkit.Art* string

---@class bukkit.Art : java.Object
---@field getBlockWidth fun(): integer
---@field getBlockHeight fun(): integer

---@param id bukkit.Art*|bukkit.NamespacedKey|bukkit.Art
---@return bukkit.Art
function bukkit.art(id)
    if type(id) == "string" then
        return Art[id]
    end
    if bukkit.isNamespacedKey(id) then
        ---@cast id bukkit.NamespacedKey
        return bukkit.registry.ART.getOrThrow(id)
    end
    ---@cast id bukkit.Art
    return id
end
