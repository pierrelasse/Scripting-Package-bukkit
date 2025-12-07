local ChatColor = import("org.bukkit.ChatColor")


---@alias bukkit.ChatColor* string
---| "BLACK"
---| "DARK_BLUE"
---| "DARK_GREEN"
---| "DARK_AQUA"
---| "DARK_RED"
---| "DARK_PURPLE"
---| "GOLD"
---| "GRAY"
---| "DARK_GRAY"
---| "BLUE"
---| "GREEN"
---| "AQUA"
---| "RED"
---| "LIGHT_PURPLE"
---| "YELLOW"
---| "WHITE"
---| "MAGIC"
---| "BOLD"
---| "STRIKETHROUGH"
---| "UNDERLINE"
---| "ITALIC"
---|>"RESET"

---@deprecated
---@param name bukkit.ChatColor*|java.Object
---@return java.Object
function bukkit.chatColor(name)
    if type(name) ~= "string" then return name end
    return ChatColor[name]
end
