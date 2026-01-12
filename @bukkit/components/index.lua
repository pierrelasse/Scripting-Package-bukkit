---@deprecated
local this = {}

---@deprecated
---@return string
function this.convertHex(input)
    scripting.warningDeprecated("bukkit.components.convertHex")
    local output = input:gsub("§#(%x%x%x%x%x%x)", function(hex)
        return "§x§"..hex:sub(1, 1).."§"..hex:sub(2, 2)..
            "§"..hex:sub(3, 3).."§"..hex:sub(4, 4)..
            "§"..hex:sub(5, 5).."§"..hex:sub(6, 6)
    end)
    return output
end

---@deprecated
---@param message string
---@return java.Object
function this.parse(message)
    scripting.warningDeprecated("bukkit.components.parse")
    local TextComponent = import("net.md_5.bungee.api.chat.TextComponent")
    ---@diagnostic disable-next-line: deprecated
    return TextComponent.fromLegacy(this.convertHex(message))
end

---@deprecated
function this.deserialize(data)
    scripting.warningDeprecated("bukkit.components.deserialize")
    if type(data) == "table" then
        local json = require("@base/json")
        data = json.encode(data)
    end
    local ComponentSerializer = import("net.md_5.bungee.chat.ComponentSerializer")
    return ComponentSerializer.parse(data)
end

bukkit.components = this
