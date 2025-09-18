local ComponentSerializer = import("net.md_5.bungee.chat.ComponentSerializer")

local json = require("@base/json")


---@class bukkit.components.Score

---@class bukkit.components.ClickEvent

---@class bukkit.components.Extra

---@class bukkit.components.HoverEvent

---@class bukkit.components.Text

---@alias bukkit.components.Deserializable string|bukkit.components.Text|(string|bukkit.components.Text)[]

---@deprecated
function bukkit.components.deserialize(data)
    scripting.warningDeprecated("bukkit.components.deserialize")
    if type(data) == "table" then data = json.encode(data) end
    return ComponentSerializer.parse(data)
end
