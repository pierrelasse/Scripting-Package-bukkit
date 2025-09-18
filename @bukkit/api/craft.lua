local CraftLocation = import("org.bukkit.craftbukkit.util.CraftLocation")
local CraftMagicNumbers = import("org.bukkit.craftbukkit.util.CraftMagicNumbers")

local this = {}

---@param location java.Object org.bukkit.Location
function this.toBlockPosition(location)
    return CraftLocation.toBlockPosition(location)
end

---@param material java.Object org.bukkit.Material
function this.getBlock(material)
    return CraftMagicNumbers.getBlock(material)
end

bukkit.craft = this
