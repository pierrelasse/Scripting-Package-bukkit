local Biome = import("org.bukkit.block.Biome")


---@param v bukkit.block.Biome|any
function bukkit.isBiome(v) return instanceof(v, Biome) end

---@param id bukkit.NamespacedKeyLike|bukkit.block.Biome*|bukkit.block.Biome
---@return bukkit.block.Biome?
function bukkit.biome(id)
    if bukkit.isBiome(id) then ---@cast id bukkit.block.Biome
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.block.Biome*
    if type(id) == "string" and not id:contains(":") then
        id = bukkit.nskM(id:lower())
    end
    return bukkit.registry.BIOME.get(bukkit.nsk(id))
end
