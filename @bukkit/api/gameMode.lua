local GameMode = import("org.bukkit.GameMode")


---@alias bukkit.GameMode* string
---| "SURVIVAL"
---| "CREATIVE"
---| "ADVENTURE"
---| "SPECTATOR"

---org.bukkit.GameMode
---@class bukkit.GameMode : java.Enum
---@field getValue fun(): integer

---@param name bukkit.GameMode*|bukkit.GameMode
---@return bukkit.GameMode
function bukkit.gameMode(name)
    if type(name) ~= "string" then return name end
    return GameMode[name]
end

---@param entity bukkit.Entity
---@param gameMode bukkit.GameMode*|bukkit.GameMode
function bukkit.setGameMode(entity, gameMode)
    entity.setGameMode(bukkit.gameMode(gameMode))
end
