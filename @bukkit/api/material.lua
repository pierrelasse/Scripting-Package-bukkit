local Material = import("org.bukkit.Material")


---@param name bukkit.Material*|bukkit.Material
---@return bukkit.Material
function bukkit.material(name)
    if type(name) ~= "string" then return name end
    return Material.valueOf(name)
end

---@param name string
---@return bukkit.Material?
function bukkit.materialMatch(name)
    return Material.matchMaterial(name)
end
