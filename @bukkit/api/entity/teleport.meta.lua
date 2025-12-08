---@alias bukkit.entity.teleport.TeleportCause* string
---| "UNKNOWN"
---| "plugin"
---| "command"
---| "ender_pearl"
---| "nether_portal"
---| "end_portal"
---| "end_gateway"
---| "spectate"
---| "consumable_effect"
---| "dismount"
---| "exit_bed"
---| "chorus_fruit" #deprecated(1.21.5)

---@class bukkit.entity.teleport.TeleportCause : java.Enum

---@alias bukkit.entity.teleport.TeleportFlag*
---| "relative/velocity_x"
---| "relative/velocity_y"
---| "relative/velocity_z"
---| "relative/velocity_rotation"
---
---| "entityState/retain_passengers"
---| "entityState/retain_vehicle"
---| "entityState/retain_open_inventory"

---@class bukkit.entity.teleport.TeleportFlag : java.Object
