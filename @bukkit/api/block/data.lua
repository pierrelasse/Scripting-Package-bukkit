---@class bukkit.block.data.BlockData : java.Object
---@field getMaterial fun(): bukkit.Material
---@field getAsString fun(hideUnspecified?: boolean): string
---@field merge fun(data: bukkit.block.data.BlockData): bukkit.block.data.BlockData
---@field matches fun(data: bukkit.block.data.BlockData): boolean
---@field clone fun(): bukkit.block.data.BlockData
---@field getSoundGroup fun(): bukkit.SoundGroup
---@field getLightEmission fun(): integer
---@field isOccluding fun(): boolean
---@field requiresCorrectToolForDrops fun(): boolean
---@field isPreferredTool fun(tool: bukkit.ItemStack)
---@field getPistonMoveReaction fun(): bukkit.block.PistonMoveReaction
---@field isSupported fun(location: bukkit.Location): boolean
---@field isFaceSturdy fun(face: bukkit.block.BlockFace)
---@field getMapColor fun(): bukkit.Color
---@field getPlacementMaterial fun(): bukkit.Material
---@field rotate fun(rotation: bukkit.block.structure.StructureRotation)
---@field mirror fun(mirror: bukkit.block.structure.Mirror)
---@field copyTo fun(other: bukkit.block.data.BlockData)
---@field createBlockState fun(): bukkit.block.BlockState

-- TODO: creator

---Creates a new `BlockData` instance for the specified Material, with all properties initialized to<br>
---unspecified defaults.
---@param material bukkit.MaterialBlock*|bukkit.Material
---@return java.Object blockData org.bukkit.block.data.BlockData
function bukkit.blockDataM(material)
    return bukkit.Bukkit.createBlockData(
        bukkit.material(material)
    )
end

---Creates a new `BlockData` instance with material and properties parsed from provided data.
---@param data string
---@return java.Object blockData org.bukkit.block.data.BlockData
function bukkit.blockDataS(data)
    return bukkit.Bukkit.createBlockData(
        data
    )
end

---Creates a new `BlockData` instance for the specified Material, with all properties initialized to<br>
---unspecified defaults, except for those provided in data.
---@param material bukkit.MaterialBlock*|java.Object
---@param data string
---@return java.Object blockData org.bukkit.block.data.BlockData
function bukkit.blockDataMS(material, data)
    return bukkit.Bukkit.createBlockData(
        material,
        data
    )
end
