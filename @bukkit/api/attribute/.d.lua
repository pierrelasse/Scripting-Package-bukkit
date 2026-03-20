--#region Attribute

---@alias bukkit.attribute.AttributeLike bukkit.NamespacedKeyLike|bukkit.attribute.Attribute*|bukkit.attribute.Attribute

---#minecraft_version(1.21.8)
---@alias bukkit.attribute.Attribute* string
---| "max_health" Maximum health of an Entity.
---| "follow_range" Range at which an Entity will follow others.
---| "knockback_resistance" Resistance of an Entity to knockback.
---| "movement_speed" Movement speed of an Entity.
---| "flying_speed" Flying speed of an Entity.
---| "attack_damage" Attack damage of an Entity.
---| "attack_knockback" Attack knockback of an Entity.
---| "attack_speed" Attack speed of an Entity.
---| "armor" Armor bonus of an Entity.
---| "armor_toughness" Armor durability bonus of an Entity.
---| "fall_damage_multiplier" The fall damage multiplier of an Entity.
---| "luck" Luck bonus of an Entity.
---| "max_absorption" Maximum absorption of an Entity.
---| "safe_fall_distance" The distance which an Entity can fall without damage.
---| "scale" The relative scale of an Entity.
---| "step_height" The height which an Entity can walk over.
---| "gravity" The gravity applied to an Entity.
---| "jump_strength" Strength with which an Entity will jump.
---| "burning_time" How long an entity remains burning after ignition.
---| "camera_distance" The camera distance of a player to their own entity.
---| "explosion_knockback_resistance" Resistance to knockback from explosions.
---| "movement_efficiency" Movement speed through difficult terrain.
---| "oxygen_bonus" Oxygen use underwater.
---| "water_movement_efficiency" Movement speed through water.
---| "tempt_range" Range at which mobs will be tempted by items.
---| "block_interaction_range" The block reach distance of a Player.
---| "entity_interaction_range" The entity reach distance of a Player.
---| "block_break_speed" Block break speed of a Player.
---| "mining_efficiency" Mining speed for correct tools.
---| "sneaking_speed" Sneaking speed.
---| "submerged_mining_speed" Underwater mining speed.
---| "sweeping_damage_ratio" Sweeping damage.
---| "spawn_reinforcements" Chance of a zombie to spawn reinforcements.
---| "waypoint_transmit_range" Attribute controlling the range an entity transmits itself as a waypoint.
---| "waypoint_receive_range" Attribute controlling the range an entity receives other waypoints from.

---@class bukkit.attribute.Attribute : bukkit.Keyed, bukkit.Translatable, bukkit.registry.RegistryAware

--#endregion

---@class bukkit.attribute.Attributable : java.Object
---@field getAttribute fun(attribute: bukkit.attribute.Attribute): bukkit.attribute.AttributeInstance?

--#region AttributeModifierOperation

---@alias bukkit.attribute.AttributeModifierOperationLike bukkit.attribute.AttributeModifierOperation*|bukkit.attribute.AttributeModifierOperation

---@alias bukkit.attribute.AttributeModifierOperation* string
---| "add_number"
---| "add_scalar"
---| "multiply_scalar_1"

---@class bukkit.attribute.AttributeModifierOperation : java.Object

--#endregion

-- TODO
---@class bukkit.attribute.AttributeModifier : bukkit.Keyed
---@field getName fun(): string
---@field getAmount fun(): number
---@field getOperation fun(): bukkit.attribute.AttributeModifierOperation
---@field getSlot fun(): bukkit.inventory.EquipmentSlot
---@field getSlotGroup fun(): bukkit.inventory.EquipmentSlotGroup

---@class bukkit.attribute.AttributeInstance : java.Object
---@field getAttribute fun(): bukkit.attribute.Attribute
---@field getBaseValue fun(): number
---@field setBaseValue fun(value: number)
---@field getModifiers fun(): java.Collection<bukkit.attribute.AttributeModifier>
---@field addModifier fun(modifier: bukkit.attribute.AttributeModifier)
---@field removeModifier fun(modifier: bukkit.attribute.AttributeModifier)
---@field getValue fun(): number
---@field getDefaultValue fun(): number
