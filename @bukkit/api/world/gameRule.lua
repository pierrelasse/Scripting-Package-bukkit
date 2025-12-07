local GameRule = import("org.bukkit.GameRule")


---@param name bukkit.GameRule*|bukkit.GameRule
---@return bukkit.GameRule?
function bukkit.gameRule(name)
    if type(name) ~= "string" then return name end
    return GameRule.getByName(name)
end
