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
