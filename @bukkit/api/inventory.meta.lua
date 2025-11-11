---org.bukkit.inventory.ItemStack
---@class bukkit.ItemStack : bukkit.Translatable
---@field getType fun(): bukkit.Material
---@field setType fun(type: bukkit.Material)
---@field getAmount fun(): integer
---@field setAmount fun(amount: integer)
---@field getMaxStackSize fun(): integer
---@field isSimilar fun(itemStack: bukkit.ItemStack): boolean
---@field clone fun(): bukkit.ItemStack
---@field hasItemMeta fun(): boolean
---@field getItemMeta fun(): java.Object? -- TODO
---@field setItemMeta fun(meta: java.Object?) -- TODO
---@field getTranslationKey fun(): string

--#region Inventories

---@class bukkit.inventory.AbstractHorseInventory : bukkit.inventory.Inventory
---@field getSaddle fun(): bukkit.ItemStack?
---@field setSaddle fun(v: bukkit.ItemStack?)

---@class bukkit.inventory.AnvilInventory : bukkit.inventory.Inventory -- TODO

---@class bukkit.inventory.ArmoredHorseInventory : bukkit.inventory.AbstractHorseInventory
---@field getArmor fun(): bukkit.ItemStack?
---@field setArmor fun(v: bukkit.ItemStack?)

---@class bukkit.inventory.BeaconInventory : bukkit.inventory.Inventory
---@field getItem fun(): bukkit.ItemStack?
---@field setItem fun(v: bukkit.ItemStack)

---@class bukkit.inventory.CraftingInventory : bukkit.inventory.Inventory
---@field getMatrix fun(): java.array<bukkit.ItemStack>?
---@field setMatrix fun(v: java.array<bukkit.ItemStack>?)
---@field getResult fun(): bukkit.ItemStack?
---@field setResult fun(v: bukkit.ItemStack?)

---@class bukkit.inventory.HorseInventory : bukkit.inventory.AbstractHorseInventory, bukkit.inventory.ArmoredHorseInventory

---@class bukkit.inventory.Inventory : java.Iterable<bukkit.ItemStack>
---@field getSize fun(): integer
---@field getMaxStackSize fun(): integer
---@field setMaxStackSize fun(v: integer)
---@field getItem fun(slot: integer): bukkit.ItemStack?
---@field setItem fun(slot: integer, itemStack: bukkit.ItemStack?)
---@field addItem fun(itemStacks: java.array<bukkit.ItemStack>): java.Map<integer, bukkit.ItemStack>
---@field removeItem fun(itemStacks: java.array<bukkit.ItemStack>): java.Map<integer, bukkit.ItemStack>
---@field removeItemAnySlot fun(itemStacks: java.array<bukkit.ItemStack>): java.Map<integer, bukkit.ItemStack>
---@field getContents fun(): java.array<bukkit.ItemStack|nil>
---@field setContents fun(v: java.array<bukkit.ItemStack|nil>)
---@field getStorageContents fun(): java.array<bukkit.ItemStack|nil>
---@field setStorageContents fun(v: java.array<bukkit.ItemStack|nil>)
---@field contains fun(id: bukkit.Material|bukkit.ItemStack, i: integer) -- TODO
---@field containsAtLeast fun(itemStack: bukkit.ItemStack, i: integer) -- TODO
---@field all function -- TODO
---@field first function -- TODO
---@field firstEmtpy fun(): integer
---@field isEmpty fun(): boolean
---@field remove fun(id: bukkit.Material|bukkit.ItemStack)
---@field clear fun(i?: integer)?
---@field close fun()
---@field getViewers fun(): java.List<bukkit.entity.HumanEntity>
---@field getType fun(): java.Object -- TODO
---@field getHolder fun(b?: boolean): bukkit.inventory.InventoryHolder? -- TODO
---@field iterator fun(i?: integer): java.Iterator<bukkit.ItemStack> -- TODO
---@field getLocation fun(): bukkit.Location?


---@class bukkit.inventory.HoseInventory : java.Object

---org.bukkit.inventory.PlayerInventory
---@class bukkit.inventory.PlayerInventory : bukkit.inventory.Inventory
---@field getItem fun(slot: integer|bukkit.inventory.EquipmentSlot): bukkit.ItemStack?
---@field setItem fun(slot: integer|bukkit.inventory.EquipmentSlot, itemStack: bukkit.ItemStack?)
---@field getArmorContents fun(): java.array<bukkit.ItemStack>
---@field setArmorContents fun(items: java.array<bukkit.ItemStack>?)
---@field getExtraContents fun(): java.array<bukkit.ItemStack>
---@field setExtraContents fun(items: java.array<bukkit.ItemStack>?)
---@field getHelmet fun(): bukkit.ItemStack?
---@field setHelmet fun(itemStack: bukkit.ItemStack?)
---@field getChestplate fun(): bukkit.ItemStack?
---@field setChestplate fun(itemStack: bukkit.ItemStack?)
---@field getLeggings fun(): bukkit.ItemStack?
---@field setLeggings fun(itemStack: bukkit.ItemStack?)
---@field getBoots fun(): bukkit.ItemStack?
---@field setBoots fun(itemStack: bukkit.ItemStack?)
---@field getItemInMainHand fun(): bukkit.ItemStack
---@field setItemInMainHand fun(itemStack: bukkit.ItemStack?)
---@field getItemInOffHand fun(): bukkit.ItemStack
---@field setItemInOffHand fun(itemStack: bukkit.ItemStack?)
---@field getHeldItemSlot fun(): integer
---@field setHeltItemSlot fun(slot: integer)
---@field getHolder fun(): bukkit.entity.HumanEntity

---@class bukkit.inventory.Merchant : java.Object

--#endegion

---@class bukkit.inventory.InventoryHolder : java.Object
---@field getInventory fun(): bukkit.inventory.Inventory

-- TODO
---@class bukkit.inventory.InventoryView : java.Object
---@field getTopInventory fun(): bukkit.inventory.Inventory
---@field getBottomInventory fun(): bukkit.inventory.Inventory
---@field getPlayer fun(): bukkit.entity.HumanEntity
---@field getType fun(): java.Enum -- TODO
---@field getItem fun(slot: integer): bukkit.ItemStack?
---@field setItem fun(slot: integer, itemStack: bukkit.ItemStack?)
---@field getCursor fun(): bukkit.ItemStack
---@field setCursor fun(itemStack: bukkit.ItemStack?)
---@field getInventory fun(rawSlot: integer): bukkit.inventory.Inventory?
---@field convertSlot fun(rawSlot: integer): integer
---@field getSlotType fun(slot: integer): java.Object -- TODO
---@field open fun()
---@field close fun()
---@field countSlots fun(): integer
---@field setProperty fun(prop: java.Object, value: integer): boolean -- TODO
---@field getTitle fun(): string
---@field setTitle fun(title: string) -- Should not be used
---@field getMenuType fun(): java.Object? -- TODO

---@alias bukkit.inventory.EquipmentSlot* string
---| "HAND"
---| "OFF_HAND"
---| "FEET"
---| "LEGS"
---| "CHEST"
---| "HEAD"
---| "BODY"

---@class bukkit.inventory.EquipmentSlot : java.Enum
---@field getGroup fun(): bukkit.inventory.EquipmentSlotGroup

---@alias bukkit.inventory.EquipmentSlotGroup* string
---| "ANY"
---| "MAINHAND"
---| "OFFHAND"
---| "HAND"
---| "FEET"
---| "LEGS"
---| "CHEST"
---| "HEAD"
---| "ARMOR"

---@class bukkit.inventory.EquipmentSlotGroup : java.Predicate<bukkit.inventory.EquipmentSlot>
---@field test fun(slot: bukkit.inventory.EquipmentSlot): boolean

---@alias bukkit.inventory.InventoryType* string
---| "CHEST" # 27, "Chest", MenuType.GENERIC_9X3 -- A chest inventory, with 0, 9, 18, 27, 36, 45, or 54 slots of type CONTAINER.
---| "DISPENSER" # 9, "Dispenser", MenuType.GENERIC_3X3 -- A dispenser inventory, with 9 slots of type CONTAINER.
---| "DROPPER" # 9, "Dropper", MenuType.GENERIC_3X3 -- A dropper inventory, with 9 slots of type CONTAINER.
---| "FURNACE" # 3, "Furnace", MenuType.FURNACE -- A furnace inventory, with a RESULT slot, a CRAFTING slot, and a FUEL slot.
---| "WORKBENCH" # 10, "Crafting", MenuType.CRAFTING -- A workbench inventory, with 9 CRAFTING slots and a RESULT slot.
---| "CRAFTING" # 5, "Crafting", null, false -- A player''s crafting inventory, with 4 CRAFTING slots and a RESULT slot. Also implies that the 4 ARMOR slots are accessible.
---| "ENCHANTING" # 2, "Enchanting", MenuType.ENCHANTMENT -- An enchantment table inventory, with two CRAFTING slots and three enchanting buttons.
---| "BREWING" # 5, "Brewing", MenuType.BREWING_STAND -- A brewing stand inventory, with one FUEL slot and four CRAFTING slots.
---| "PLAYER" # 43, "Player", MenuType.GENERIC_9X4 -- A player''s inventory, with 9 QUICKBAR slots, 27 CONTAINER slots, 4 ARMOR slots, 1 offhand slot, 1 body slot and 1 saddle slot. <p> The ARMOR and offhand slots are conditionally visible to the player, while body and saddle slot are never visible.
---| "CREATIVE" # 9, "Creative", null, false -- The creative mode inventory, with only 9 QUICKBAR slots and nothing else. (The actual creative interface with the items is client-side and cannot be altered by the server.)
---| "MERCHANT" # 3, "Villager", MenuType.MERCHANT, false -- The merchant inventory, with 2 CRAFTING slots, and 1 RESULT slot.
---| "ENDER_CHEST" # 27, "Ender Chest", MenuType.GENERIC_9X3 -- The ender chest inventory, with 27 slots.
---| "ANVIL" # 3, "Repairing", MenuType.ANVIL -- An anvil inventory, with 2 CRAFTING slots and 1 RESULT slot
---| "SMITHING" # 4, "Upgrade Gear", MenuType.SMITHING -- A smithing inventory, with 3 CRAFTING slots and 1 RESULT slot.
---| "BEACON" # 1, "container.beacon", MenuType.BEACON -- A beacon inventory, with 1 CRAFTING slot
---| "HOPPER" # 5, "Item Hopper", MenuType.HOPPER -- A hopper inventory, with 5 slots of type CONTAINER.
---| "SHULKER_BOX" # 27, "Shulker Box", MenuType.SHULKER_BOX -- A shulker box inventory, with 27 slots of type CONTAINER.
---| "BARREL" # 27, "Barrel", MenuType.GENERIC_9X3 -- A barrel box inventory, with 27 slots of type CONTAINER.
---| "BLAST_FURNACE" # 3, "Blast Furnace", MenuType.BLAST_FURNACE -- A blast furnace inventory, with a RESULT slot, a CRAFTING slot, and a FUEL slot.
---| "LECTERN" # 1, "Lectern", MenuType.LECTERN -- A lectern inventory, with 1 BOOK slot.
---| "SMOKER" # 3, "Smoker", MenuType.SMOKER -- A smoker inventory, with a RESULT slot, a CRAFTING slot, and a FUEL slot.
---| "LOOM" # 4, "Loom", MenuType.LOOM -- Loom inventory, with 3 CRAFTING slots, and 1 RESULT slot.
---| "CARTOGRAPHY" # 3, "Cartography Table", MenuType.CARTOGRAPHY_TABLE -- Cartography inventory with 2 CRAFTING slots, and 1 RESULT slot.
---| "GRINDSTONE" # 3, "Repair & Disenchant", MenuType.GRINDSTONE -- Grindstone inventory with 2 CRAFTING slots, and 1 RESULT slot.
---| "STONECUTTER" # 2, "Stonecutter", MenuType.STONECUTTER -- Stonecutter inventory with 1 CRAFTING slot, and 1 RESULT slot.
---| "COMPOSTER" # 1, "Composter", null, false -- Pseudo composter inventory with 0 or 1 slots of undefined type.
---| "CHISELED_BOOKSHELF" # 6, "Chiseled Bookshelf", null, false -- Pseudo chiseled bookshelf inventory, with 6 slots of undefined type.
---| "JUKEBOX" # 1, "Jukebox", null, false -- Pseudo jukebox inventory with 1 slot of undefined type.
---| "DECORATED_POT" # 1, "Decorated Pot", null, false -- Pseudo decorated pot with 1 slot of undefined type.
---| "CRAFTER" # 9, "Crafter", MenuType.CRAFTER_3X3 -- A crafter inventory, with 9 CRAFTING slots.

---@class bukkit.inventory.InventoryType : java.Enum
---@field getDefaultSize fun(): integer
---@field getMenuType fun(): java.Object?
---@field isCreatable fun(): boolean
