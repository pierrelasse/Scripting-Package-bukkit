-- TODO

local Art = import("org.bukkit.Art")


---@param id bukkit.Art*|bukkit.NamespacedKey|bukkit.Art
---@return bukkit.Art?
function bukkit.art(id)
    if type(id) == "string" then
        return Art[id]
    end
    if bukkit.isNamespacedKey(id) then ---@cast id bukkit.NamespacedKey
        return bukkit.registry.ART.get(id)
    end
    ---@cast id bukkit.Art
    return id
end
