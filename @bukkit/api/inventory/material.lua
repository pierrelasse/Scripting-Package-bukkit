local Material = import("org.bukkit.Material")


---@param v bukkit.Material|any
function bukkit.isMaterial(v) return instanceof(v, Material) end

---@param id bukkit.MaterialLike
---@return bukkit.Material?
function bukkit.material(id)
    if bukkit.isMaterial(id) then ---@cast id bukkit.Material
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.Material*
    if type(id) == "string" then
        local v = java.enumValueOf(Material, id:upper())
        if v then return v end
    end
    return bukkit.registry.MATERIAL.get(bukkit.nsk(id))
end

bukkit.materialOrNil = bukkit.material

---@param id bukkit.MaterialLike
---@return bukkit.Material
function bukkit.materialNN(id)
    local v = bukkit.material(id)
    if v == nil then error("material with id '"..id.."' not found") end
    return v
end

---@param name string
---@return bukkit.Material?
function bukkit.materialMatch(name)
    return Material.matchMaterial(name)
end
