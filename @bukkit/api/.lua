local UUID = import("java.util.UUID")
local Scripting = import("net.bluept.scripting.Scripting")


---Instance of the plugin.
---@type java.Object
bukkit.platform = Scripting.getPlatform()

bukkit.isFolia = false
pcall(function() bukkit.isFolia = bukkit.platform.isFolia == true end) -- TODO

---@deprecated
function bukkit.getPlatform()
    scripting.warningDeprecated("bukkit.getPlatform")
    return bukkit.platform
end

bukkit.hex = bukkit.components.convertHex

---@param target java.Object|{ getUniqueId: fun(): any }
---@return string
function bukkit.uuid(target)
    return tostring(target.getUniqueId())
end

---@param o string
---@return java.Object? uuid
function bukkit.uuidFromString(o)
    if type(o) ~= "string" then return o end
    local uuid
    pcall(function()
        uuid = UUID.fromString(o)
    end)
    return uuid
end

-- TODO
---@param target bukkit.entity.HumanEntity
function bukkit.isInCreativeOrSpec(target)
    local g = tostring(target.getGameMode())
    return g == "CREATIVE" or g == "SPECTATOR"
end

require("@bukkit/api/craft")

require("@bukkit/api/advancement")
require("@bukkit/api/art")
require("@bukkit/api/attribute")
require("@bukkit/api/block")
require("@bukkit/api/block_banner")
require("@bukkit/api/block_data")
require("@bukkit/api/block_structure")
require("@bukkit/api/boss")
require("@bukkit/api/chatColor")
require("@bukkit/api/chunk")
require("@bukkit/api/color")
require("@bukkit/api/console")
require("@bukkit/api/damage")
require("@bukkit/api/dyeColor")
require("@bukkit/api/effect")
require("@bukkit/api/enchantments")
require("@bukkit/api/entity")
require("@bukkit/api/entityType")
require("@bukkit/api/gameMode")
require("@bukkit/api/inventory")
require("@bukkit/api/itemFlag")
require("@bukkit/api/location")
require("@bukkit/api/material")
require("@bukkit/api/metadata")
require("@bukkit/api/namespacedKey")
require("@bukkit/api/particle")
require("@bukkit/api/persistence")
require("@bukkit/api/players")
require("@bukkit/api/potion")
require("@bukkit/api/potionEffect")
require("@bukkit/api/recipes")
require("@bukkit/api/registry")
require("@bukkit/api/scoreboard")
require("@bukkit/api/scoreboard_team")
require("@bukkit/api/send")
require("@bukkit/api/sound")
require("@bukkit/api/vector")
require("@bukkit/api/world")

require("@bukkit/api/ItemBuilder")
