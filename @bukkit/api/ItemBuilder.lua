local UUID = import("java.util.UUID")
local GameProfile = import("com.mojang.authlib.GameProfile")
local Property = import("com.mojang.authlib.properties.Property")
local ResolvableProfile = import("net.minecraft.world.item.component.ResolvableProfile")
local ItemStack = import("org.bukkit.inventory.ItemStack")
local ItemFlag = import("org.bukkit.inventory.ItemFlag")
local ItemRarity = import("org.bukkit.inventory.ItemRarity")


---@class bukkit.ItemBuilder
---@field itemStack bukkit.ItemStack
---@field meta java.Object
local this = {}
this.__index = this

---Creates a new ItemBuilder from a material
---
---**Example:**
---```lua
---local myItem = ItemBuilder.of("STONE")
---    :amount(12)
---    :displayName("§aMy Stone!")
---    :lore({
---        "Line 1",
---        "Line 2"
---    })
---    :build()
---```
---@param material bukkit.MaterialItem*|bukkit.Material
function this.of(material)
    return this.fromItemStack(ItemStack(bukkit.material(material)))
end

---@param itemStack bukkit.ItemStack
function this.fromItemStack(itemStack)
    local self = setmetatable({}, this)

    self.itemStack = itemStack
    ---@diagnostic disable-next-line: assign-type-mismatch
    self.meta = itemStack.getItemMeta()

    return self
end

function this:clone()
    local cloned = setmetatable({}, this)

    cloned.itemStack = self.itemStack.clone()
    cloned.meta = self.meta.clone()

    return cloned
end

---@param cb fun(meta: java.Object)
---@return self
function this:custom(cb)
    cb(self.meta)

    return self
end

---@param cb fun(builder: bukkit.ItemBuilder)
---@return self
function this:use(cb)
    cb(self)

    return self
end

---Finish and get the itemstack.
---@return bukkit.ItemStack
function this:build()
    if self.meta ~= nil then
        self.itemStack.setItemMeta(self.meta)
    end
    return self.itemStack
end

--#region Stack

---Set the itemstack size.
---@param amount integer
---@return self
function this:amount(amount)
    self.itemStack.setAmount(amount)

    return self
end

--#endregion

--#region Components

---@alias bukkit.api.ItemBuilder.DataComponentTypes* string
---| "max_stack_size" -- Valued<@IntRange(from = 1, to = 99) Integer>
---| "max_damage" -- Valued<@Positive Integer>
---| "damage" -- Valued<@NonNegative Integer>
---| "unbreakable" -- NonValued
---| "custom_name" -- Valued<Component>
---| "item_name" -- Valued<Component>
---| "item_model" -- Valued<Key>
---| "lore" -- Valued<ItemLore>
---| "rarity" -- Valued<ItemRarity>
---| "enchantments" -- Valued<ItemEnchantments>
---| "can_place_on" -- Valued<ItemAdventurePredicate>
---| "can_break" -- Valued<ItemAdventurePredicate>
---| "attribute_modifiers" -- Valued<ItemAttributeModifiers>
---| "custom_model_data" -- Valued<CustomModelData>
---| "tooltip_display" -- Valued<TooltipDisplay>
---| "repair_cost" -- Valued<@NonNegative Integer>
---| "enchantment_glint_override" -- Valued<Boolean>
---| "intangible_projectile" -- NonValued
---| "food" -- Valued<FoodProperties>
---| "consumable" -- Valued<Consumable>
---| "use_remainder" -- Valued<UseRemainder>
---| "use_cooldown" -- Valued<UseCooldown>
---| "damage_resistant" -- Valued<DamageResistant>
---| "tool" -- Valued<Tool>
---| "weapon" -- Valued<Weapon>
---| "enchantable" -- Valued<Enchantable>
---| "equippable" -- Valued<Equippable>
---| "repairable" -- Valued<Repairable>
---| "glider" -- NonValued
---| "tooltip_style" -- Valued<Key>
---| "death_protection" -- Valued<DeathProtection>
---| "blocks_attacks" -- Valued<BlocksAttacks>
---| "stored_enchantments" -- Valued<ItemEnchantments>
---| "dyed_color" -- Valued<DyedItemColor>
---| "map_color" -- Valued<MapItemColor>
---| "map_id" -- Valued<MapId>
---| "map_decorations" -- Valued<MapDecorations>
---| "map_post_processing" -- Valued<MapPostProcessing>
---| "charged_projectiles" -- Valued<ChargedProjectiles>
---| "bundle_contents" -- Valued<BundleContents>
---| "potion_contents" -- Valued<PotionContents>
---| "potion_duration_scale" -- Valued<Float>
---| "suspicious_stew_effects" -- Valued<SuspiciousStewEffects>
---| "writable_book_content" -- Valued<WritableBookContent>
---| "written_book_content" -- Valued<WrittenBookContent>
---| "trim" -- Valued<ItemArmorTrim>
---| "instrument" -- Valued<MusicInstrument>
---| "provides_trim_material" -- Valued<TrimMaterial>
---| "ominous_bottle_amplifier" -- Valued<OminousBottleAmplifier>
---| "jukebox_playable" -- Valued<JukeboxPlayable>
---| "provides_banner_patterns" -- Valued<TagKey<PatternType>>
---| "recipes" -- Valued<List<Key>>
---| "lodestone_tracker" -- Valued<LodestoneTracker>
---| "firework_explosion" -- Valued<FireworkEffect>
---| "fireworks" -- Valued<Fireworks>
---| "profile" -- Valued<ResolvableProfile>
---| "note_block_sound" -- Valued<Key>
---| "banner_patterns" -- Valued<BannerPatternLayers>
---| "base_color" -- Valued<DyeColor>
---| "pot_decorations" -- Valued<PotDecorations>
---| "container" -- Valued<ItemContainerContents>
---| "block_state" -- Valued<BlockItemDataProperties>
---| "container_loot" -- Valued<SeededContainerLoot>
---| "break_sound" -- Valued<Key>
---| "villager/variant" -- Valued<Villager.Type>
---| "wolf/variant" -- Valued<Wolf.Variant>
---| "wolf/sound_variant" -- Valued<Wolf.SoundVariant>
---| "wolf/collar" -- Valued<DyeColor>
---| "fox/variant" -- Valued<Fox.Type>
---| "salmon/size" -- Valued<Salmon.Variant>
---| "parrot/variant" -- Valued<Parrot.Variant>
---| "tropical_fish/pattern" -- Valued<TropicalFish.Pattern>
---| "tropical_fish/base_color" -- Valued<DyeColor>
---| "tropical_fish/pattern_color" -- Valued<DyeColor>
---| "mooshroom/variant" -- Valued<MushroomCow.Variant>
---| "rabbit/variant" -- Valued<Rabbit.Type>
---| "pig/variant" -- Valued<Pig.Variant>
---| "cow/variant" -- Valued<Cow.Variant>
---| "chicken/variant" -- Valued<Chicken.Variant>
---| "frog/variant" -- Valued<Frog.Variant>
---| "horse/variant" -- Valued<Horse.Color>
---| "painting/variant" -- Valued<Art>
---| "llama/variant" -- Valued<Llama.Color>
---| "axolotl/variant" -- Valued<Axolotl.Variant>
---| "cat/variant" -- Valued<Cat.Type>
---| "cat/collar" -- Valued<DyeColor>
---| "sheep/color" -- Valued<DyeColor>
---| "shulker/color" -- Valued<DyeColor>

do
    local DataComponentTypes = importOrNil("io.papermc.paper.datacomponent.DataComponentTypes")
    if DataComponentTypes ~= nil then
        ---@param id bukkit.api.ItemBuilder.DataComponentTypes*
        ---@return java.Object?
        local function dct(id)
            return bukkit.registry.DATA_COMPONENT_TYPE.get(bukkit.namespacedKey(id, "minecraft"))
        end
        this.DataCompT = dct

        ---WIP!
        ---@param type bukkit.api.ItemBuilder.DataComponentTypes*
        ---@param value unknown
        ---@return self
        function this:dataCompValued(type, value)
            self.itemStack.setItemMeta(self.meta)

            local t = dct(type)
            self.itemStack.setData(t, value)

            self.meta = self.itemStack.getItemMeta() or self.meta

            return self
        end

        ---WIP!
        ---@param type bukkit.api.ItemBuilder.DataComponentTypes*
        ---@return self
        function this:dataCompNonValued(type)
            self.itemStack.setItemMeta(self.meta)

            local t = dct(type)
            self.itemStack.setData(t)

            self.meta = self.itemStack.getItemMeta() or self.meta

            return self
        end

        ---WIP!
        ---@param type bukkit.api.ItemBuilder.DataComponentTypes*
        ---@return self
        function this:dataCompUnset(type)
            self.itemStack.setItemMeta(self.meta)

            local t = dct(type)
            self.itemStack.unsetData(t)

            self.meta = self.itemStack.getItemMeta() or self.meta

            return self
        end
    end
end

--#endregion

--#region Base

---#Paper
---Sets the custom name.
---@param v adventure.text.Component?
---@return self
function this:customName(v)
    self.meta.customName(v)

    return self
end

---Sets the display name of the item.
---@param v nil|string|adventure.text.Component
---@return self
function this:displayName(v)
    if v == nil then
        self.meta.setDisplayName(nil)
    elseif type(v) == "string" then
        self.meta.setDisplayName(bukkit.hex(v))
    elseif comp ~= nil and comp.is(v) then
        self.meta.setDisplayName(comp.legacySerialize(v))
    end

    return self
end

---Sets the item name.<br>
---Item name differs from display name in that it is cannot be edited by an anvil, is not styled with<br>
---italics, and does not show labels.
---@param v nil|string|adventure.text.Component
---@return self
function this:itemName(v)
    if v == nil then
        self.meta.setItemName(nil)
    elseif type(v) == "string" then
        self.meta.setItemName(bukkit.hex(v))
    elseif comp ~= nil and comp.is(v) then
        self.meta.itemName(v)
    end

    return self
end

---Set's the item name.
---@param v nil|string|adventure.text.Component
---@return self
function this:name(v)
    self.meta.setDisplayName(comp.legacySerialize(
        comp.text("§r").append(comp.from(v))
    ))

    return self
end

---Sets the lore/description of the item.
---@param v nil|string|(string|adventure.text.Component)[]|adventure.text.Component|java.List<string>|java.array<string>
---@return self
function this:lore(v)
    if v == nil then
        self.meta.setLore(nil)
    elseif type(v) == "string" then
        self:lore(v:split("\n"))
    elseif type(v) == "table" then
        ---@cast v (string|adventure.text.Component)[]
        local list = java.list(#v) ---@type java.List<string|adventure.text.Component>
        for line in table.valuesLoop(v) do
            if type(line) == "string" then
                line = bukkit.hex(line)
            elseif comp ~= nil and comp.is(line) then
                line = comp.legacySerialize(line)
            end
            list.add(line)
        end
        self:lore(list)
    elseif comp ~= nil and comp.is(v) then
        local list = java.list() ---@type java.List<string>
        for line in forEach(comp.legacySerialize(v):split("\n")) do -- TODO: fix new line coloring
            list.add(line)
        end
        self.meta.setLore(list)
    elseif arrays.is(v) then
        self.meta.setLore(arrays.toList(v))
    else
        self.meta.setLore(v)
    end

    return self
end

---Sets the custom model data.<br>
---CustomModelData is an integer that may be associated client side with a custom item model.
---@param v nil|integer|fun(component: bukkit.inventory.meta.components.CustomModelDataComponent)
---@return self
function this:customModelData(v)
    if type(v) == nil then
        -- TODO: what if there are no components yet
        self.meta.setCustomModelDataComponent(v)
    elseif type(v) == "number" then
        self.meta.setCustomModelData(v)
    elseif type(v) == "function" then
        local component = self.meta.getCustomModelDataComponent()
        v(component)
        self.meta.setCustomModelDataComponent(component)
    end

    return self
end

---Sets the enchantable. Higher values allow higher enchantments.
---@param v? integer
---@return self
function this:enchantable(v)
    self.meta.setEnchantable(v)

    return self
end

---@param enchantment bukkit.enchantments.Enchantment*|bukkit.enchantments.Enchantment
---@param level integer
---@param safe? boolean=`false`
---@return self
function this:enchant(enchantment, level, safe)
    self.meta.addEnchant(bukkit.enchantment(enchantment), level, safe ~= true)

    return self
end

-- TODO: remove enchant

---@return self
function this:removeEnchantments()
    self.meta.removeEnchantments()

    return self
end

---@param v? boolean=`true`
---@return self
function this:enchantmentGlintOverride(v)
    if v == nil then v = true end

    self.meta.setEnchantmentGlintOverride(v)

    return self
end

---@param ... bukkit.ItemFlag*
---@return self
function this:addFlags(...)
    self.meta.addItemFlags(
        arrays.mapped(
            arrayOf(...),
            function(e)
                return ItemFlag.valueOf(e)
            end
        )
    )
    return self
end

this.addItemFlags = this.addFlags

---@param ... bukkit.ItemFlag*
---@return self
function this:removeFlags(...)
    local flags = { ... }
    local arr = makeArray(ItemFlag, #flags)
    for i, flag in ipairs(flags) do
        arr[i] = ItemFlag.valueOf(flag)
    end
    self.meta.removeItemFlags(arr)
    return self
end

this.removeItemFlags = this.removeFlags

---@return self
function this:hideAll()
    self.meta.addItemFlags(ItemFlag.values())

    return self
end

---Set if the item tooltip in inventories should be shown.
---@param v? boolean=`true`
---@return self
function this:hideTooltip(v)
    if v == nil then v = true end

    self.meta.setHideTooltip(v)

    return self
end

---@param v nil|bukkit.NamespacedKey
---@return self
function this:tooltipStyle(v)
    if v == nil then
        self.meta.setTooltipStyle(nil)
    elseif bukkit.isNamespacedKey(v) then
        self.meta.setTooltipStyle(v)
    end

    return self
end

---@param v nil|bukkit.NamespacedKey
---@return self
function this:itemModel(v)
    if v == nil then
        self.meta.setItemModel(nil)
    elseif bukkit.isNamespacedKey(v) then
        self.meta.setItemModel(v)
    end

    return self
end

---Sets the unbreakable tag. An unbreakable item will not lose durability.
---@param v? boolean=`true`
---@return self
function this:unbreakable(v)
    if v == nil then v = true end

    self.meta.setUnbreakable(v)

    return self
end

---@param v? boolean=`true`
---@return self
function this:glider(v)
    if v == nil then v = true end

    self.meta.setGlider(v)

    return self
end

---If the item should burn in lava.
---@param v? boolean=`true`
---@return self
function this:fireResistant(v)
    if v == nil then v = true end

    self.meta.setFireResistant(v)

    return self
end

---@param v nil|java.Object
---@return self
function this:damageResistant(v)
    self.meta.setDamageResistant(v)

    return self
end

---The maximum amount which an item will stack.
---@param v integer
---@return self
function this:maxStackSize(v)
    self.meta.setMaxStackSize(v)

    return self
end

---@param v nil|"COMMON"|"UNCOMMON"|"RARE"|"EPIC"
---@return self
function this:rarity(v)
    if v == nil then
        self.meta.setRarity(v)
    else
        self.meta.setRarity(ItemRarity.valueOf(v))
    end

    return self
end

---@param v nil|bukkit.ItemStack
---@return self
function this:useRemainder(v)
    self.meta.setUseRemainder(v)

    return self
end

---@param v nil|fun(component: bukkit.inventory.meta.components.UseCooldownComponent)
---@return self
function this:useCooldown(v)
    if v == nil then
        self.meta.setUseCooldown(nil)
    else
        local component = self.meta.getUseCooldown()
        v(component)
        self.meta.setUseCooldown(component)
    end

    return self
end

---@param v nil|fun(component: bukkit.inventory.meta.components.FoodComponent)
---@return self
function this:food(v)
    if v == nil then
        self.meta.setFood(nil)
    else
        local component = self.meta.getFood()
        v(component)
        self.meta.setFood(component)
    end

    return self
end

---@param v nil|fun(component: bukkit.inventory.meta.components.ToolComponent)
---@return self
function this:tool(v)
    if v == nil then
        self.meta.setTool(nil)
    else
        local component = self.meta.getTool()
        v(component)
        self.meta.setTool(component)
    end

    return self
end

---@param v nil|fun(component: bukkit.inventory.meta.components.EquippableComponent)
---@return self
function this:equippable(v)
    if v == nil then
        self.meta.setEquippable(nil)
    else
        local component = self.meta.getEquippable()
        v(component)
        self.meta.setEquippable(component)
    end

    return self
end

---@param v nil|fun(component: bukkit.inventory.meta.components.JukeboxPlayableComponent)
---@return self
function this:jukeboxPlayable(v)
    if v == nil then
        self.meta.setJukeboxPlayable(nil)
    else
        local component = self.meta.getJukeboxPlayable()
        v(component)
        self.meta.setJukeboxPlayable(component)
    end

    return self
end

-- TODO: attribute modifiers



--#endregion

--#region Common

---Set the color of leather armor for example.
---@param r integer 0-255
---@param g integer 0-255
---@param b integer 0-255
---@return self
function this:color(r, g, b)
    self.meta.setColor(bukkit.color(r, g, b))

    return self
end

--#endregion

--#region PlayerHead

---Set the texture of a player head
---@param texture string base64 string
---@return self
function this:playerHead_texture(texture)
    local uuid = UUID(0, 0)

    local profile = GameProfile(uuid, "")
    local property = Property("textures", texture)
    profile.getProperties().put("textures", property)

    local resolvableProfileFailed =
        ResolvableProfile ~= nil
        and not pcall(function()
            self.meta.profile = ResolvableProfile(profile)
        end)

    if resolvableProfileFailed then
        self.meta.profile = profile
    end

    return self
end

---@deprecated
function this.skull_texture(...)
    scripting.warningDeprecated("bukkit/api/ItemBuilder#skull_texture")
    return this.playerHead_texture(...)
end

---@deprecated
function this.head(...)
    scripting.warningDeprecated("bukkit/api/ItemBuilder#head")
    return this.playerHead_texture(...)
end

---@param offlinePlayer bukkit.OfflinePlayer
---@return self
function this:playerHead_player(offlinePlayer)
    self.meta.setOwningPlayer(offlinePlayer)

    return self
end

--#endregion

--#region Banner

---Set the patterns of a banner.
---@param patterns java.Object[] org.bukkit.block.banner.Pattern[]
---@return self
function this:banner_setPatterns(patterns)
    local patternsList = makeList()
    for _, pattern in ipairs(patterns) do
        patternsList.add(pattern)
    end
    self.meta.setPatterns(patternsList)

    return self
end

--#endregion

--#region Potion

---@param data java.Object Use `bukkit.potionData`
---@return self
function this:potion_baseData(data)
    self.meta.setBasePotionData(data)

    return self
end

---@param type bukkit.PotionType
---@return self
function this:potion_baseType(type)
    self.meta.setBasePotionType(bukkit.potionType(type))

    return self
end

---@param effect java.Object Use `bukkit.potionEffect`
---@param overwrite? boolean=`true`
---@return self
function this:potion_addCustomEffect(effect, overwrite)
    if overwrite == nil then overwrite = true end

    self.meta.addCustomEffect(effect, overwrite)

    return self
end

---@param type bukkit.PotionEffectType*|bukkit.PotionEffectType
---@return self
function this:potion_removeCustomEffect(type)
    self.meta.removeCustomEffect(bukkit.potionEffectType(type))

    return self
end

---@return self
function this:potion_clearCustomEffects()
    self.meta.clearCustomEffects()

    return self
end

---@param color bukkit.Color
---@return self
function this:potion_color(color)
    self.meta.setColor(color)

    return self
end

---@param name string?
---@return self
function this:potion_customName(name)
    self.meta.setCustomName(name)

    return self
end

--#endregion

--#region DataContainer

---@class bukkit.ItemBuilder_DataContainer
---@field get fun(key: string|bukkit.NamespacedKey, type: bukkit.persistence.DataType*|bukkit.persistence.DataType): any
---@field set fun(key: string|bukkit.NamespacedKey, type: bukkit.persistence.DataType*|bukkit.persistence.DataType, value: any)

---@private
function this._wrapDataContainer(dataContainer)
    ---@type bukkit.ItemBuilder_DataContainer
    return {
        get = function(key, type)
            return dataContainer.get(
                bukkit.namespacedKey(key),
                bukkit.persistentDataType(type)
            )
        end,
        set = function(key, type, value)
            if type == "BYTE" then
                value = java.cast(value, "byte")
            elseif type == "SHORT" then
                value = java.cast(value, "short")
            elseif type == "LONG" then
                value = java.cast(value, "long")
            elseif type == "FLOAT" then
                value = java.cast(value, "float")
            elseif type == "DOUBLE" then
                value = java.cast(value, "double")
            end

            dataContainer.set(
                bukkit.namespacedKey(key),
                bukkit.persistentDataType(type),
                value
            )
        end
    }
end

---@param itemStack bukkit.ItemStack
---@return bukkit.ItemBuilder_DataContainer?
function this.WrapDataContainer(itemStack)
    if itemStack == nil then return end
    local meta = itemStack.getItemMeta()
    if meta == nil then return end
    return this._wrapDataContainer(meta.getPersistentDataContainer())
end

---@param cb fun(container: bukkit.ItemBuilder_DataContainer)
---@return self
function this:dataContainer(cb)
    cb(this._wrapDataContainer(self.meta.getPersistentDataContainer()))

    return self
end

---@param key string|bukkit.NamespacedKey
---@param dataType bukkit.persistence.DataType*
function this:getData(key, dataType)
    ---@type bukkit.persistence.DataContainer
    local persistentDataContainer = self.meta.getPersistentDataContainer()
    return persistentDataContainer.get(
        bukkit.namespacedKey(key),
        bukkit.persistentDataType(dataType)
    )
end

--#endregion

bukkit.buildItem = this.of
bukkit.modifyItem = this.fromItemStack

return this
