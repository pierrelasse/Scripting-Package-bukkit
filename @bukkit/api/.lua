local Scripting = import("net.bluept.scripting.Scripting")


---Instance of the plugin.
bukkit.platform = Scripting.getPlatform() ---@type java.Object

bukkit.isPaper = false
bukkit.isFolia = false
-- TODO: Compatability with older plugin versions
pcall(function() bukkit.isPaper = bukkit.platform.isPaper end)
pcall(function() bukkit.isFolia = bukkit.platform.isFolia end)

if bukkit.isPaper and bukkit._DONT_LOAD_ADVENTURE then
    require("@base/paman").need("adventure")
end

require("@bukkit/api/deprecated/")
require("@bukkit/api/deprecated/chatColor")

require("@bukkit/api/attribute/")

require("@bukkit/api/block/")
require("@bukkit/api/block/banner")
require("@bukkit/api/block/biome")
require("@bukkit/api/block/data")
require("@bukkit/api/block/structure")

require("@bukkit/api/entity/")
require("@bukkit/api/entity/entityType")
require("@bukkit/api/entity/player/")

require("@bukkit/api/inventory/")
require("@bukkit/api/inventory/art")
require("@bukkit/api/inventory/dyeColor")
require("@bukkit/api/inventory/enchantments")
require("@bukkit/api/inventory/itemFlag")
require("@bukkit/api/ItemBuilder")

require("@bukkit/api/potion/")
require("@bukkit/api/potion/potionEffect")

require("@bukkit/api/scoreboard/")
require("@bukkit/api/scoreboard/team")

require("@bukkit/api/sys/console")
require("@bukkit/api/sys/namespacedKey")
require("@bukkit/api/sys/registry")

require("@bukkit/api/util/")
require("@bukkit/api/util/color")
require("@bukkit/api/util/transformation")

require("@bukkit/api/world/")
require("@bukkit/api/world/chunk")
require("@bukkit/api/world/effect")
require("@bukkit/api/world/gameRule")
require("@bukkit/api/world/location")
require("@bukkit/api/world/particle")
require("@bukkit/api/world/sound")
require("@bukkit/api/world/spawnAndPlay")
require("@bukkit/api/world/util")

require("@bukkit/api/damage")
require("@bukkit/api/gameMode")
require("@bukkit/api/material")
require("@bukkit/api/metadata")
require("@bukkit/api/offlinePlayer")
require("@bukkit/api/persistence")
require("@bukkit/api/recipes")
require("@bukkit/api/send")
