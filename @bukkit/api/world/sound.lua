local SoundCategory = import("org.bukkit.SoundCategory")


---org.bukkit.SoundGroup
---@class bukkit.SoundGroup : java.Object
-- TODO

---@alias bukkit.SoundCategory string
---| "MASTER"
---| "MUSIC"
---| "RECORDS"
---| "WEATHER"
---| "BLOCKS"
---| "HOSTILE"
---| "NEUTRAL"
---| "PLAYERS"
---| "AMBIENT"
---| "VOICE"

---@param name bukkit.SoundCategory|java.Object
---@return java.Object soundCategory org.bukkit.SoundCategory
function bukkit.soundCategory(name)
    if type(name) ~= "string" then return name end
    return SoundCategory[name]
end
