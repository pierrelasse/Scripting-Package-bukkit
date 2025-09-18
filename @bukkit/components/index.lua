local TextComponent = import("net.md_5.bungee.api.chat.TextComponent")


---@deprecated
local this = {}

---Converts `§#FFFFFF` into `§x§F§F§F§F§F§F`.
---@param input string
---@return string
function this.convertHex(input)
    local output = input:gsub("§#(%x%x%x%x%x%x)", function(hex)
        return "§x§"..hex:sub(1, 1).."§"..hex:sub(2, 2)..
            "§"..hex:sub(3, 3).."§"..hex:sub(4, 4)..
            "§"..hex:sub(5, 5).."§"..hex:sub(6, 6)
    end)
    return output
end

---@param message string
---@return java.Object
function this.parse(message)
    return TextComponent.fromLegacy(this.convertHex(message))
end

bukkit.components = this

require("@bukkit/components/deserialize")
