---org.bukkit.entity.AbstractArrow
---@class bukkit.entity.AbstractArrow : bukkit.entity.Projectile

---org.bukkit.entity.AbstractHorse
---@class bukkit.entity.AbstractHorse : bukkit.entity.Vehicle, bukkit.inventory.InventoryHolder, bukkit.entity.Tameable
---@field getDomestication fun(): integer
---@field setDomestication fun(v: integer)
---@field getMaxDomestication fun(): integer
---@field setMaxDomestication fun(v: integer)
---@field getJumpStrength fun(): integer
---@field setJumpStrength fun(v: integer)
---@field getInventory fun(): java.Object -- TODO
---@field isEatingGrass fun(): boolean -- Paper
---@field setEatingGrass fun(v: boolean) -- Paper
---@field isRearing fun(): boolean -- Paper
---@field setRearing fun(v: boolean) -- Paper
---@field isEating fun(): boolean -- Paper
---@field setEating fun(v: boolean) -- Paper

---org.bukkit.entity.AbstractSkeleton
---@class bukkit.entity.AbstractSkeleton : bukkit.entity.Monster

---org.bukkit.entity.AbstractVillager
---@class bukkit.entity.AbstractVillager : bukkit.entity.Breedable, bukkit.entity.NPC, bukkit.inventory.InventoryHolder, bukkit.inventory.Merchant

---org.bukkit.entity.AbstractWindCharge
---@class bukkit.entity.AbstractWindCharge : bukkit.entity.Fireball

---org.bukkit.entity.Ageable
---@class bukkit.entity.Ageable : bukkit.entity.Creature
---@field getAge fun(): integer
---@field setAge fun(v: integer)
---@field setBaby fun()
---@field isAdult fun(): boolean
---@field setAdult fun()

---org.bukkit.entity.Allay
---@class bukkit.entity.Allay : bukkit.entity.Creature, bukkit.inventory.InventoryHolder

---org.bukkit.entity.Ambient
---@class bukkit.entity.Ambient : bukkit.entity.Mob

---org.bukkit.entity.Animals
---@class bukkit.entity.Animals : bukkit.entity.Breedable

---org.bukkit.entity.AnimalTamer
---@class bukkit.entity.AnimalTamer

---org.bukkit.entity.AreaEffectCloud
---@class bukkit.entity.AreaEffectCloud : bukkit.Entity
---@field getDuration fun(): integer
---@field setDuration fun(v: integer)
---@field getWaitTime fun(): integer
---@field setWaitTime fun(v: integer)
---@field getReapplicationDelay fun(): integer
---@field setReapplicationDelay fun(v: integer)
---@field getDurationOnUse fun(): integer
---@field setDurationOnUse fun(v: integer)
---@field getRadius fun(): java.float
---@field setRadius fun(radius: java.float)
---@field getRadiusOnUse fun(): java.float
---@field setRadiusOnUse fun(v: java.float)
---@field getRadiusPerTick fun(): java.float
---@field setRadiusPerTick fun(v: java.float)
---@field getParticle fun(): bukkit.Particle
---@field setParticle fun(v: bukkit.Particle, data?: unknown)
---@field getBasePotionType fun(): bukkit.PotionType?
---@field setBasePotionType fun(type: bukkit.PotionType?)
---@field hasCustomEffects fun(): boolean
---@field getCustomEffects fun(): java.List<bukkit.PotionEffect>
---@field addCustomEffect fun(effect: bukkit.PotionEffect, overwrite: boolean): boolean
---@field removeCustomEffect fun(type: bukkit.PotionEffectType): boolean
---@field hasCustomEffect fun(type: bukkit.PotionEffectType): boolean
---@field clearCustomEffects fun()
---@field getColor fun(): bukkit.Color
---@field setColor fun(v: bukkit.Color)
---@field getSource fun(): bukkit.projectiles.ProjectileSource?
---@field setSource fun(v: bukkit.projectiles.ProjectileSource?)

---org.bukkit.entity.Armadillo
---@class bukkit.entity.Armadillo : bukkit.entity.Animals

---org.bukkit.entity.ArmorStand
---@class bukkit.entity.ArmorStand : bukkit.entity.LivingEntity

---org.bukkit.entity.Arrow
---@class bukkit.entity.Arrow : bukkit.entity.AbstractArrow

---org.bukkit.entity.Axolotl
---@class bukkit.entity.Axolotl : bukkit.entity.Animals

---org.bukkit.entity.Bat
---@class bukkit.entity.Bat : bukkit.entity.Ambient

---org.bukkit.entity.Bee
---@class bukkit.entity.Bee : bukkit.entity.Animals

---org.bukkit.entity.Blaze
---@class bukkit.entity.Blaze : bukkit.entity.Monster

---org.bukkit.entity.BlockDisplay
---@class bukkit.entity.BlockDisplay : bukkit.entity.Display

---org.bukkit.entity.Boat
---@class bukkit.entity.Boat : bukkit.entity.Vehicle

---org.bukkit.entity.Bogged
---@class bukkit.entity.Bogged : bukkit.entity.AbstractSkeleton, bukkit.entity.Shearable

---org.bukkit.entity.Boss
---@class bukkit.entity.Boss : bukkit.Entity

---org.bukkit.entity.Breedable
---@class bukkit.entity.Breedable : bukkit.entity.Ageable
---@field getAgeLock fun(): boolean
---@field setAgeLock fun(v: boolean)
---@field canBreed fun(): boolean
---@field setBreed fun(v: boolean)

---org.bukkit.entity.Breeze
---@class bukkit.entity.Breeze : bukkit.entity.Monster

---org.bukkit.entity.BreezeWindCharge
---@class bukkit.entity.BreezeWindCharge : bukkit.entity.AbstractWindCharge

---org.bukkit.entity.Camel
---@class bukkit.entity.Camel : bukkit.entity.AbstractHorse, bukkit.entity.Sittable

---org.bukkit.entity.Cat
---@class bukkit.entity.Cat : bukkit.entity.Tameable, bukkit.entity.Sittable

---org.bukkit.entity.CaveSpider
---@class bukkit.entity.CaveSpider : bukkit.entity.Spider

---org.bukkit.entity.ChestBoat
---@class bukkit.entity.ChestBoat : bukkit.entity.Boat, bukkit.inventory.InventoryHolder -- TODO

---org.bukkit.entity.ChestedHorse
---@class bukkit.entity.ChestedHorse : bukkit.entity.AbstractHorse

---org.bukkit.entity.Chicken
---@class bukkit.entity.Chicken : bukkit.entity.Animals

---org.bukkit.entity.Cod
---@class bukkit.entity.Cod : bukkit.entity.Fish

---org.bukkit.entity.ComplexEntityPart
---@class bukkit.entity.ComplexEntityPart : bukkit.Entity

---org.bukkit.entity.ComplexLivingEntity
---@class bukkit.entity.ComplexLivingEntity : bukkit.entity.LivingEntity

---org.bukkit.entity.Cow
---@class bukkit.entity.Cow : bukkit.entity.Animals

---org.bukkit.entity.Creaking
---@class bukkit.entity.Creaking : bukkit.entity.Monster

---org.bukkit.entity.Creature
---@class bukkit.entity.Creature : bukkit.entity.Mob

---org.bukkit.entity.Creeper
---@class bukkit.entity.Creeper : bukkit.entity.Monster

---org.bukkit.entity.Damageable
---@class bukkit.entity.Damageable : bukkit.Entity
---@field damage fun(amount: number, source?: bukkit.Entity|java.Object) -- TODO
---@field getHealth fun(): number
---@field setHealth fun(health: number)
---@field getAbsorptionAmount fun(): number
---@field setAbsorptionAmount fun(amount: number)
---@field getMaxHealth fun(): number
---@field setMaxHealth fun(health: number)
---@field resetMaxHealth fun()

---@aliases bukkit.entity.Display.Billboard* string
---| "FIXED" -- No rotation (default).
---| "VERTICAL" -- Can pivot around vertical axis.
---| "HORIZONTAL" -- Can pivot around horizontal axis.
---| "CENTER" -- Can pivot around center point.

---org.bukkit.entity.Display$Billboard
---@class bukkit.entity.Display.Billboard : java.Enum

---org.bukkit.entity.Display$Brightness
---@class bukkit.entity.Display.Brightness : java.Object
---@field getBlockLight fun(): integer
---@field getSkyLight fun(): integer

---org.bukkit.entity.Display
---@class bukkit.entity.Display : bukkit.Entity
---@field getTransformation fun(): bukkit.Transformation
---@field setTransformation fun(v: bukkit.Transformation)
---@field setTransformationMatrix fun(v: java.Object)
---@field getInterpolationDelay fun(): integer
---@field setInterpolationDelay fun(v: integer)
---@field getInterpolationDuration fun(): integer
---@field setInterpolationDuration fun(v: integer)
---@field getTeleportDuration fun(): integer
---@field setTeleportDuration fun(v: integer)
---@field getViewRange fun(): integer
---@field setViewRange fun(v: integer)
---@field getShadowRadius fun(): java.float
---@field setShadowRadius fun(v: java.float)
---@field getShadowStrength fun(): java.float
---@field setShadowStrength fun(v: java.float)
---@field getDisplayWidth fun(): java.float
---@field setDisplayWidth fun(v: java.float)
---@field getDisplayHeight fun(): java.float
---@field setDisplayHeight fun(v: java.float)
---@field getBillboard fun(): bukkit.entity.Display.Billboard
---@field setBillboard fun(v: bukkit.entity.Display.Billboard)
---@field getGlowColorOverride fun(): bukkit.Color?
---@field setGlowColorOverride fun(v: bukkit.Color?)
---@field getBrightness fun(): bukkit.entity.Display.Brightness?
---@field setBrightness fun(v: bukkit.entity.Display.Brightness?)

---org.bukkit.entity.Dolphin
---@class bukkit.entity.Dolphin : bukkit.entity.Ageable, bukkit.entity.WaterMob

---org.bukkit.entity.Donkey
---@class bukkit.entity.Donkey : bukkit.entity.ChestedHorse

---org.bukkit.entity.DragonFireball
---@class bukkit.entity.DragonFireball : bukkit.entity.Fireball

---org.bukkit.entity.Drowned
---@class bukkit.entity.Drowned : bukkit.entity.Zombie

---org.bukkit.entity.Egg
---@class bukkit.entity.Egg : bukkit.entity.ThrowableProjectile

---org.bukkit.entity.ElderGuardian
---@class bukkit.entity.ElderGuardian : bukkit.entity.Guardian

---org.bukkit.entity.EnderCrystal
---@class bukkit.entity.EnderCrystal : bukkit.Entity

---org.bukkit.entity.EnderDragon
---@class bukkit.entity.EnderDragon : bukkit.entity.ComplexLivingEntity, bukkit.entity.Boss, bukkit.entity.Mob, bukkit.entity.Enemy

---org.bukkit.entity.EnderDragonPart
---@class bukkit.entity.EnderDragonPart : bukkit.entity.ComplexEntityPart, bukkit.entity.Damageable

---org.bukkit.entity.Enderman
---@class bukkit.entity.Enderman : bukkit.entity.Monster

---org.bukkit.entity.Endermite
---@class bukkit.entity.Endermite : bukkit.entity.Monster

---org.bukkit.entity.EnderPearl
---@class bukkit.entity.EnderPearl : bukkit.entity.ThrowableProjectile

---org.bukkit.entity.EnderSignal
---@class bukkit.entity.EnderSignal : bukkit.Entity

---org.bukkit.entity.Enemy
---@class bukkit.entity.Enemy : bukkit.entity.LivingEntity

---org.bukkit.entity.EntityCategory
---@class bukkit.entity.EntityCategory : java.Enum

---org.bukkit.entity.EntityFactory
---@class bukkit.entity.EntityFactory : java.Object

---org.bukkit.entity.EntitySnapshot
---@class bukkit.entity.EntitySnapshot : java.Object

---org.bukkit.entity.EntityType
---@class bukkit.entity.EntityType : java.Enum, bukkit.Keyed, bukkit.Translatable, bukkit.registry.RegistryAware

---org.bukkit.entity.Evoker
---@class bukkit.entity.Evoker : bukkit.entity.Spellcaster

---org.bukkit.entity.EvokerFangs
---@class bukkit.entity.EvokerFangs : bukkit.Entity

---org.bukkit.entity.ExperienceOrb
---@class bukkit.entity.ExperienceOrb

---org.bukkit.entity.Explosive
---@class bukkit.entity.Explosive : bukkit.Entity
---@field setYield fun(yield: java.float) # Set the radius affected by this explosive's explosion.<br>This is the base yield, which may be affected by other entity attributes.
---@field getYield fun(): java.float
---@field setIsIncendiary fun(incendiary: boolean) # Whether or not this explosive creates a fire when exploding.
---@field isIncendiary fun(): boolean # Whether or not this explosive creates a fire when exploding.

---org.bukkit.entity.FallingBlock
---@class bukkit.entity.FallingBlock

---org.bukkit.entity.Fireball
---@class bukkit.entity.Fireball : bukkit.entity.Projectile

---org.bukkit.entity.Firework
---@class bukkit.entity.Firework : bukkit.Entity -- TODO

---org.bukkit.entity.Fish
---@class bukkit.entity.Fish : bukkit.Entity -- TODO

---org.bukkit.entity.FishHook
---@class bukkit.entity.FishHook : bukkit.Entity -- TODO

---org.bukkit.entity.Flying
---@class bukkit.entity.Flying : bukkit.Entity -- TODO

---org.bukkit.entity.Fox
---@class bukkit.entity.Fox : bukkit.Entity -- TODO

---org.bukkit.entity.Frog
---@class bukkit.entity.Frog : bukkit.Entity -- TODO

---org.bukkit.entity.Ghast
---@class bukkit.entity.Ghast : bukkit.Entity -- TODO

---org.bukkit.entity.Giant
---@class bukkit.entity.Giant : bukkit.Entity -- TODO

---org.bukkit.entity.GlowItemFrame
---@class bukkit.entity.GlowItemFrame : bukkit.Entity -- TODO

---org.bukkit.entity.GlowSquid
---@class bukkit.entity.GlowSquid : bukkit.Entity -- TODO

---org.bukkit.entity.Goat
---@class bukkit.entity.Goat : bukkit.Entity -- TODO

---org.bukkit.entity.Golem
---@class bukkit.entity.Golem : bukkit.Entity -- TODO

---org.bukkit.entity.Guardian
---@class bukkit.entity.Guardian : bukkit.Entity -- TODO

---org.bukkit.entity.Hanging
---@class bukkit.entity.Hanging : bukkit.Entity -- TODO

---org.bukkit.entity.Hoglin
---@class bukkit.entity.Hoglin : bukkit.Entity -- TODO

---org.bukkit.entity.Horse
---@class bukkit.entity.Horse : bukkit.entity.AbstractHorse
---@field getColor fun(): bukkit.entity.Horse.Color
---@field setColor fun(v: bukkit.entity.Horse.Color)
---@field getStyle fun(): bukkit.entity.Horse.Style
---@field setStyle fun(v: bukkit.entity.Horse.Style)
---@field getInventory fun(): bukkit.inventory.HorseInventory

---@class bukkit.entity.Horse.Color : java.Enum

---@class bukkit.entity.Horse.Style : java.Enum

---org.bukkit.entity.HumanEntity
---@class bukkit.entity.HumanEntity : bukkit.entity.LivingEntity, bukkit.entity.AnimalTamer, bukkit.inventory.InventoryHolder
---@field getName fun(): string
---@field getInventory fun(): bukkit.inventory.PlayerInventory
---@field getEnderChest fun(): bukkit.inventory.Inventory
---@field getMainHand fun(): java.Object -- TODO
---@field getEnchantmentSeed fun(): integer
---@field setEnchantmentSeed fun(seed: integer)
---@field getOpenInventory fun(): bukkit.inventory.InventoryView
---@field openInventory fun(inventory: bukkit.inventory.Inventory|bukkit.inventory.InventoryView): bukkit.inventory.InventoryView
---@field closeInventory fun()
---@field getItemOnCursor fun(): bukkit.ItemStack
---@field setItemOnCursor fun(itemStack: bukkit.ItemStack?)
---@field hasCooldown fun(material: bukkit.Material|bukkit.ItemStack): boolean
---@field getCooldown fun(material: bukkit.Material|bukkit.ItemStack): integer
---@field setCooldown fun(material: bukkit.Material|bukkit.ItemStack, ticks: integer)
---@field getSleepTicks fun(): integer
---@field sleep fun(location: bukkit.Location, force: boolean)
---@field wakeup fun(setSpawnLocation: boolean)
---@field startRiptideAttack fun(duration: integer, attackStrength: java.float, attackItem: bukkit.ItemStack?)
---@field getBedLocation fun(): bukkit.Location
---@field getGameMode fun(): bukkit.GameMode
---@field setGameMode fun(gameMode: bukkit.GameMode)
---@field isBlocking fun(): boolean
---@field isHandRaised fun(): boolean
---@field getExpToLevel fun(): integer
---@field getAttackCooldown fun(): java.float
---@field discoverRecipe fun(recipe: bukkit.NamespacedKey): boolean
---@field discoverRecipes function -- TODO
---@field undiscoverRecipe function -- TODO
---@field undiscoverRecipes function -- TODO
---@field hasDiscoveredRecipe function -- TODO
---@field getDiscoveredRecipes function -- TODO
---@field openSign function -- TODO
---@field dropItem function -- TODO
---@field getExhaustion fun(): java.float
---@field setExhaustion fun(v: java.float)
---@field getSaturation fun(): java.float
---@field setSaturation fun(v: java.float)
---@field getFoodLevel fun(): integer
---@field setFoodLevel fun(v: integer)
---@field getSaturatedRegenRate fun(): integer
---@field setSaturatedRegenRate fun(v: integer)
---@field getUnsaturatedRegenRate fun(): integer
---@field setUnsaturatedRegenRate fun(v: integer)
---@field getStarvationRate fun(): integer
---@field setStarvationRate fun(v: integer)
---@field getLastDeathLocation fun(): bukkit.Location?
---@field setLastDeathLocation fun(v: bukkit.Location?)
---@field fireworkBoost fun(itemStack: bukkit.ItemStack): bukkit.entity.Firework?

---org.bukkit.entity.Husk
---@class bukkit.entity.Husk

---org.bukkit.entity.Illager
---@class bukkit.entity.Illager

---org.bukkit.entity.Illusioner
---@class bukkit.entity.Illusioner

---org.bukkit.entity.Interaction
---@class bukkit.entity.Interaction

---org.bukkit.entity.IronGolem
---@class bukkit.entity.IronGolem

---org.bukkit.entity.Item
---@class bukkit.entity.Item : bukkit.Entity
---@field getItemStack fun(): bukkit.ItemStack
---@field setItemStack fun(v: bukkit.ItemStack)
---@field getPickupDelay fun(): integer
---@field setPickupDelay fun(v: integer)
---@field isUnlimitedLifetime fun(): boolean
---@field setUnlimitedLifetime fun(v: boolean)
---@field getOwner fun(): java.Object? -- TODO
---@field setOwner fun(v: java.Object?) -- TODO
---@field getThrower fun(): java.Object? -- TODO
---@field setThrower fun(v: java.Object?) -- TODO
---@field canMobPickup fun(): boolean
---@field setCanMobPickup fun(v: boolean)
---@field canPlayerPickup fun(): boolean
---@field setCanPlayerpickup fun(v: boolean)
---@field willAge fun(): boolean
---@field setWillAge fun(v: boolean)
---@field getHealth fun(): integer
---@field setHealth fun(v: integer)

---org.bukkit.entity.ItemDisplay
---@class bukkit.entity.ItemDisplay : bukkit.entity.Display
---@field getItemStack fun(): bukkit.ItemStack? -- Paper
---@field setItemStack fun(v: bukkit.ItemStack?)
---@field getItemDisplayTransform fun(): java.Object -- TODO
---@field setItemDisplayTransform fun(v: java.Object) -- TODO

---org.bukkit.entity.ItemFrame
---@class bukkit.entity.ItemFrame

---org.bukkit.entity.LargeFireball
---@class bukkit.entity.LargeFireball

---org.bukkit.entity.LeashHitch
---@class bukkit.entity.LeashHitch

---org.bukkit.entity.LightningStrike
---@class bukkit.entity.LightningStrike

---org.bukkit.entity.LingeringPotion
---@class bukkit.entity.LingeringPotion

---org.bukkit.entity.LivingEntity
---@class bukkit.entity.LivingEntity : bukkit.attribute.Attributable, bukkit.entity.Damageable, bukkit.projectiles.ProjectileSource
---@field getEyeHeight fun(ignorePose?: boolean): number
---@field getEyeLocation fun(): bukkit.Location
---@field getLineOfSight fun(transparent: java.Set<bukkit.Material>, maxDistance: integer): java.List<bukkit.block.Block>
---@field getTargetBlock fun(transparent: java.Set<bukkit.Material>, maxDistance: integer): bukkit.block.Block -- Paper
---@field getTargetBlockFace function -- Paper -- TODO
---@field getTargetBlockInfo function -- Paper -- TODO
---@field getTargetEntity fun(maxDistance: integer, ignoreBlocks?: boolean): bukkit.Entity? -- Paper
---@field getTargetEntityInfo function -- Paper -- TODO
---@field rayTraceEntities fun(maxDistance: integer, ignoreBlocks?: boolean): java.Object? -- Paper -- TODO
---@field getLastTwoTargetBlocks fun(transparent: java.Set<bukkit.Material>, maxDistance: integer): java.List<bukkit.block.Block>
---@field getTargetBlockExact fun(maxDistance: integer, fluidCollisionMode?: java.Object): bukkit.block.Block -- TODO
---@field rayTraceBlocks fun(maxDistance: number, fluidCollisionMode: java.Object): java.Object -- TODO
---@field getTargetEntity fun(maxDistance: integer, ignoreBlocks?: boolean): bukkit.Entity? -- TODO
---@field getRemainingAir fun(): integer
---@field setRemainingAir fun(ticks: integer)
---@field getMaximumAir fun(): integer
---@field setMaximumAir fun(ticks: integer)
---@field getItemInUseTicks fun(): integer
---@field setItemInUseTicks fun(ticks: integer)
---@field getArrowCooldown fun(): integer
---@field setArrowCooldown fun(ticks: integer)
---@field getArrowsInBody fun(): integer
---@field setArrowsInBody fun(amount: integer)
---@field getMaxmimumNoDamageTicks fun(): integer
---@field setMaximumNoDamageTicks fun(ticks: integer)
---@field getLastDamage fun(): number
---@field setLastDamage fun(damage: number)
---@field getNoDamageTicks fun(): integer
---@field setNoDamageTicks fun(ticks: integer)
---@field getNoActionTicks fun(): integer
---@field setNoActionTicks fun(ticks: integer)
---@field getKiller fun(): bukkit.entity.Player?
---@field addPotionEffect fun(effect: bukkit.PotionEffect): boolean
---@field addPotionEffects fun(effects: java.Collection<bukkit.PotionEffect>): boolean
---@field hasPotionEffect fun(type: bukkit.PotionEffectType): boolean
---@field getPotionEffect fun(type: bukkit.PotionEffectType): bukkit.PotionEffect?
---@field removePotionEffect fun(type: bukkit.PotionEffectType)
---@field getActivePotionEffects fun(): java.Collection<bukkit.PotionEffect>
---@field hasLineOfSight fun(entity: bukkit.Entity): boolean
---@field getRemoveWhenFarAway fun(): boolean
---@field setRemoveWhenFarAway fun(v: boolean)
---@field getEquipment fun(): java.Object -- TODO
---@field getCanPickupItems fun(): boolean
---@field setCanPickupItems fun(v: boolean)
---@field isLeashed fun(): boolean
---@field getLeashHolder fun(): bukkit.Entity?
---@field setLeashHolder fun(entity: bukkit.Entity): boolean
---@field isGliding fun(): boolean
---@field setGliding fun(v: boolean)
---@field isSwimming fun(): boolean
---@field setSwimming fun(v: boolean)
---@field isRiptiding fun(): boolean
---@field setRiptiding fun(v: boolean)
---@field isSleeping fun(): boolean
---@field isClimbing fun(): boolean
---@field hasAI fun(): boolean
---@field setAI fun(v: boolean)
---@field attack fun(target: bukkit.Entity)
---@field swingMainHand fun()
---@field swingOffHand fun()
---@field playHurtAnimation fun(yaw: java.float)
---@field isCollidable fun(): boolean
---@field setCollidable fun(v: boolean)
---@field getColidableExemptions java.Set<java.Object> -- TODO
---@field getMemory fun(key: java.Object): unknown -- TODO
---@field setMemory fun(key: java.Object, value: unknown) -- TODO
---@field getHurtSound fun(): java.Object -- TODO
---@field getDeathSound fun(): java.Object -- TODO
---@field getFallDamageSound fun(height: number): java.Object -- TODO
---@field getFallDamageSoundSmall fun(): java.Object -- TODO
---@field getFallDamageSoundBig fun(): java.Object -- TODO
---@field getDrinkingSound fun(): java.Object -- TODO
---@field getEatingSound fun(): java.Object -- TODO
---@field canBreathUnderwater fun(): boolean
---@field setInvisible fun(v: boolean)
---@field isInvisible fun(): boolean

---org.bukkit.entity.Llama
---@class bukkit.entity.Llama

---org.bukkit.entity.LlamaSpit
---@class bukkit.entity.LlamaSpit

---org.bukkit.entity.MagmaCube
---@class bukkit.entity.MagmaCube

---org.bukkit.entity.Marker
---@class bukkit.entity.Marker

---org.bukkit.entity.Minecart
---@class bukkit.entity.Minecart

---org.bukkit.entity.Mob
---@class bukkit.entity.Mob : bukkit.entity.LivingEntity -- TODO

---org.bukkit.entity.Monster
---@class bukkit.entity.Monster : bukkit.entity.Creature, bukkit.entity.Enemy

---org.bukkit.entity.Mule
---@class bukkit.entity.Mule

---org.bukkit.entity.MushroomCow
---@class bukkit.entity.MushroomCow

---org.bukkit.entity.NPC
---@class bukkit.entity.NPC : bukkit.entity.Creature

---org.bukkit.entity.Ocelot
---@class bukkit.entity.Ocelot

---org.bukkit.entity.OminousItemSpawner
---@class bukkit.entity.OminousItemSpawner

---org.bukkit.entity.Painting
---@class bukkit.entity.Painting

---org.bukkit.entity.Panda
---@class bukkit.entity.Panda

---org.bukkit.entity.Parrot
---@class bukkit.entity.Parrot

---org.bukkit.entity.Phantom
---@class bukkit.entity.Phantom

---org.bukkit.entity.Pig
---@class bukkit.entity.Pig

---org.bukkit.entity.Piglin
---@class bukkit.entity.Piglin

---org.bukkit.entity.PiglinAbstract
---@class bukkit.entity.PiglinAbstract

---org.bukkit.entity.PiglinBrute
---@class bukkit.entity.PiglinBrute

---org.bukkit.entity.PigZombie
---@class bukkit.entity.PigZombie

---org.bukkit.entity.Pillager
---@class bukkit.entity.Pillager

---org.bukkit.entity.Player
---@class bukkit.entity.Player : bukkit.entity.HumanEntity, bukkit.OfflinePlayer, adventure.identity.Identified, adventure.bossBar.BossBarViewer
---@field getHandle fun(): java.Object
---@field getName fun(): string
---@field getDisplayName fun(): string
---@field setDisplayName fun(name: string)
---@field getPlayerListName fun(): string
---@field setPlayerListName fun(name: string)
---@field getPlayerListOrder fun(): integer
---@field setPlayerListOrder fun(order: integer)
---@field getPlayerListHeader fun(): string
---@field setPlayerListHeader fun(header: string)
---@field getPlayerListFooter fun(): string
---@field setPlayerListFooter fun(footer: string)
---@field setPlayerListHeaderFooter fun(header: string, footer: string)
---@field getCompassTarget fun(): bukkit.Location
---@field setCompassTarget fun(location: bukkit.Location)
---@field getAddress fun(): java.Object -- TODO
---@field isTransferred fun(): boolean
---@field retreiveCookie fun(key: bukkit.NamespacedKey): java.Object -- TODO
---@field storeCookie fun(key: bukkit.NamespacedKey, value: java.array<java.byte>)
---@field transfer fun(host: string, port: integer)
---@field sendRawMessage fun(message: string)
---@field kickPlayer fun(message: string?)
---@field ban function -- TODO
---@field banIp function -- TODO
---@field chat fun(message: string)
---@field performCommand fun(command: string): boolean
---@field isOnGround fun(): boolean
---@field isSneaking fun(): boolean
---@field setSneaking fun(v: boolean)
---@field isSprinting fun(): boolean
---@field setSprinting fun(v: boolean)
---@field saveData fun()
---@field loadData fun()
---@field setSleepingIgnored fun(v: boolean)
---@field isSleepingIgnored fun(): boolean
---@field getRespawnLocation fun(): bukkit.Location?
---@field setRespawnLocation fun(location: bukkit.Location)
---@field getEnderPearls fun(): java.Collection<bukkit.entity.EnderPearl>
---@field getCurrentInput fun(): { isForward: fun(): boolean, isLeft: fun(): boolean, isRight: fun(): boolean, isBack: fun(): boolean, isJump: fun(): boolean, isSneak: fun(): boolean, isSprint: fun(): boolean } -- TODO
---@field playNote fun(location: bukkit.Location, instrument: java.Object, note: java.Object) -- TODO
---@field playSound function -- TODO
---@field stopSound function -- TODO
---@field stopAllSounds fun()
---@field playEffect function -- TODO
---@field breakBlock fun(block: bukkit.block.Block): boolean
---@field sendBlockChange fun(location: bukkit.Location, data: bukkit.block.data.BlockData)
---@field sendBlockChanges fun(blocks: java.Collection<bukkit.block.BlockState>)
---@field sendBlockDamage fun(location: bukkit.Location, progress: java.float, source?: bukkit.Entity|integer)
---@field sendEquipmentChange fun(entity: bukkit.entity.LivingEntity, slot: bukkit.inventory.EquipmentSlot, item: bukkit.ItemStack) -- TODO
---@field sendEquipmentChanges function -- TODO
---@field sendSignChange fun(location: bukkit.Location, lines: java.array<string>) -- TODO
---@field sendBlockUpdate function -- TODO
---@field sendPotionEffectChange fun(entity: bukkit.entity.LivingEntity, effect: bukkit.PotionEffect)
---@field sendPotionEffectChangeRemove fun(entity: bukkit.entity.LivingEntity, type: bukkit.PotionEffectType)
---@field sendMap function -- TODO
---@field sendLinks fun(link: java.Object) -- TODO
---@field addCustomChatCompletions fun(completions: java.Collection<string>)
---@field removeCustomChatCompletions fun(completions: java.Collection<string>)
---@field setCustomChatCompletions fun(completions: java.Collection<string>)
---@field updateInventory fun()
---@field getPreviousGamemode fun(): bukkit.GameMode*
---@field setPlayerTime fun(time: java.long, relative: boolean)
---@field getPlayerTime fun(): java.long
---@field getPlayerTimeOffset fun(): java.long
---@field isPlayerTimeRelative fun(): boolean
---@field resetPlayerTime fun()
---@field getPlayerWeather fun(): java.Object? -- TODO
---@field setPlayerWeather fun(weather: java.Object) -- TODO
---@field resetPlayerWeather fun()
---@field getExpCooldown fun(): integer
---@field setExpCooldown fun(ticks: integer)
---@field giveExp fun(amount: integer)
---@field giveExpLevels fun(levels: integer)
---@field getExp fun(): number
---@field setExp fun(exp: number)
---@field getLevel fun(): integer
---@field setLevel fun(level: integer)
---@field getTotalExperience fun(): integer
---@field setTotalExperience fun(exp: integer)
---@field sendExperienceChange fun(exp: number, level?: integer)
---@field getAllowFlight fun(): boolean
---@field setAllowFlight fun(v: boolean)
---@field hidePlayer fun(plugin: java.Object, player: bukkit.entity.Player) -- TODO
---@field showPlayer fun(plugin: java.Object, player: bukkit.entity.Player) -- TODO
---@field canSee fun(player: bukkit.Entity): boolean
---@field hideEntity fun(plugin: java.Object, entity: bukkit.Entity) -- TODO
---@field showEntity fun(plugin: java.Object, entity: bukkit.Entity) -- TODO
---@field canSee fun(entity: bukkit.Entity): boolean
---@field isFlying fun(): boolean
---@field setFlying fun(v: boolean)
---@field getFlySpeed fun(): java.float
---@field setFlySpeed fun(speed: java.float)
---@field getWalkSpeed fun(): java.float
---@field setWalkSpeed fun(speed: java.float)
---@field setResourcePack fun(url: string, hash?: java.array<java.byte>, prompt?: string, force?: boolean) -- TODO
---@field addResourcePack function -- TODO
---@field removeResourcePack function -- TODO
---@field removeResourcePacks fun()
---@field getScoreboard fun(): bukkit.scoreboard.Scoreboard
---@field setScoreboard fun(scoreboard: bukkit.scoreboard.Scoreboard)
---@field getWorldBorder fun(): java.Object -- TODO
---@field setWorldBorder fun(border: java.Object) -- TODO
---@field sendHealthUpdate fun()|fun(health: number, foodLevel: integer, saturation: number)
---@field isHealthScaled fun(): boolean
---@field setHealthScaled fun(v: boolean)
---@field setHealthScale fun(scale: number)
---@field getHealthScale fun(): number
---@field getSpectatorTarget fun(): bukkit.Entity?
---@field setSpectatorTarget fun(target: bukkit.Entity?)
---@field sendTitle function -- TODO
---@field resetTitle fun()
---@field spawnParticle function -- TODO
---@field getAdvancementProgress fun(advancement: java.Object): java.Object -- TODO
---@field getClientViewDistacne fun(): integer
---@field getPing fun(): integer
---@field getLocale fun(): string
---@field updateCommands fun()
---@field openBook function -- TODO
---@field openSign function -- TODO
---@field showDemoScreen fun()
---@field isAllowingServerListing fun(): boolean

---org.bukkit.entity.PolarBear
---@class bukkit.entity.PolarBear : bukkit.Entity -- TODO

---@alias bukkit.entity.Pose* string
---| "STANDING"
---| "FALL_FLYING"
---| "SLEEPING"
---| "SWIMMING"
---| "SPIN_ATTACK"
---| "SNEAKING"
---| "LONG_JUMPING"
---| "DYING"
---| "CROAKING"
---| "USING_TONGUE"
---| "SITTING"
---| "ROARING"
---| "SNIFFING"
---| "EMERGING"
---| "DIGGING"
---| "SLIDING"
---| "SHOOTING"
---| "INHALING"

---org.bukkit.entity.Pose
---@class bukkit.entity.Pose : java.Enum

---org.bukkit.entity.Projectile
---@class bukkit.entity.Projectile: bukkit.Entity
---@field getShooter fun(): bukkit.projectiles.ProjectileSource
---@field setShooter fun(shooter: bukkit.projectiles.ProjectileSource)

---org.bukkit.entity.PufferFish
---@class bukkit.entity.PufferFish : bukkit.Entity -- TODO

---org.bukkit.entity.Rabbit
---@class bukkit.entity.Rabbit : bukkit.Entity -- TODO

---org.bukkit.entity.Raider
---@class bukkit.entity.Raider : bukkit.Entity -- TODO

---org.bukkit.entity.Ravager
---@class bukkit.entity.Ravager : bukkit.Entity -- TODO

---org.bukkit.entity.Salmon
---@class bukkit.entity.Salmon : bukkit.Entity -- TODO

---org.bukkit.entity.Shearable
---@class bukkit.entity.Shearable : bukkit.Entity -- TODO

---org.bukkit.entity.Sheep
---@class bukkit.entity.Sheep : bukkit.Entity -- TODO

---org.bukkit.entity.Shulker
---@class bukkit.entity.Shulker : bukkit.Entity -- TODO

---org.bukkit.entity.ShulkerBullet
---@class bukkit.entity.ShulkerBullet : bukkit.Entity -- TODO

---org.bukkit.entity.Silverfish
---@class bukkit.entity.Silverfish : bukkit.Entity -- TODO

---org.bukkit.entity.Sittable
---@class bukkit.entity.Sittable : bukkit.Entity -- TODO

---org.bukkit.entity.SizedFireball
---@class bukkit.entity.SizedFireball : bukkit.Entity -- TODO

---org.bukkit.entity.Skeleton
---@class bukkit.entity.Skeleton : bukkit.Entity -- TODO

---org.bukkit.entity.SkeletonHorse
---@class bukkit.entity.SkeletonHorse : bukkit.Entity -- TODO

---org.bukkit.entity.Slime
---@class bukkit.entity.Slime : bukkit.entity.Mob, bukkit.entity.Enemy
---@field getSize fun(): integer
---@field setSize fun(v: integer)
---@field canWander fun(): boolean
---@field setWander fun(v: boolean)

---org.bukkit.entity.SmallFireball
---@class bukkit.entity.SmallFireball : bukkit.Entity -- TODO

---org.bukkit.entity.Sniffer
---@class bukkit.entity.Sniffer : bukkit.Entity -- TODO

---org.bukkit.entity.Snowball
---@class bukkit.entity.Snowball : bukkit.entity.ThrowableProjectile

---org.bukkit.entity.Snowman
---@class bukkit.entity.Snowman : bukkit.Entity -- TODO

---org.bukkit.entity.SpawnCategory
---@class bukkit.entity.SpawnCategory : bukkit.Entity -- TODO

---org.bukkit.entity.SpectralArrow
---@class bukkit.entity.SpectralArrow : bukkit.Entity -- TODO

---org.bukkit.entity.Spellcaster
---@class bukkit.entity.Spellcaster : bukkit.Entity -- TODO

---org.bukkit.entity.Spider
---@class bukkit.entity.Spider : bukkit.Entity -- TODO

---org.bukkit.entity.SplashPotion
---@class bukkit.entity.SplashPotion : bukkit.Entity -- TODO

---org.bukkit.entity.Squid
---@class bukkit.entity.Squid : bukkit.Entity -- TODO

---org.bukkit.entity.Steerable
---@class bukkit.entity.Steerable : bukkit.Entity -- TODO

---org.bukkit.entity.Stray
---@class bukkit.entity.Stray : bukkit.Entity -- TODO

---org.bukkit.entity.Strider
---@class bukkit.entity.Strider : bukkit.Entity -- TODO

---org.bukkit.entity.Tadpole
---@class bukkit.entity.Tadpole : bukkit.Entity -- TODO

---org.bukkit.entity.Tameable
---@class bukkit.entity.Tameable : bukkit.entity.Animals -- TODO
---@field isTamed fun(): boolean
---@field setTamed fun(v: boolean)
---@field getOwnerUniqueId fun(): java.UUID? -- Paper
---@field getOwner fun(): bukkit.entity.AnimalTamer?
---@field setOwner fun(v: bukkit.entity.AnimalTamer?)

---org.bukkit.entity.TextDisplay
---@class bukkit.entity.TextDisplay : bukkit.entity.Display
---@field getText fun(): string?
---@field setText fun(text: string?)
---@field getLineWidth fun(): integer
---@field setLineWidth fun(width: integer)
---@field getBackgroundColor fun(): bukkit.Color
---@field setBackgroundColor fun(color: bukkit.Color)
---@field getTextOpacity fun(): java.byte
---@field setTextOpacity fun(opacity: java.byte)
---@field isShadowed fun(): boolean
---@field setShadowed fun(v: boolean)
---@field isSeeThrough fun(): boolean
---@field setSeeThrough fun(v: boolean)
---@field isDefaultBackground fun(): boolean
---@field setDefaultBackground fun(v: boolean)
---@field getAlignment fun(): bukkit.entity.TextDisplay.TextAlignment
---@field setAlignment fun(alignment: bukkit.entity.TextDisplay.TextAlignment)

---@class bukkit.entity.TextDisplay.TextAlignment : java.Enum

---org.bukkit.entity.ThrowableProjectile
---@class bukkit.entity.ThrowableProjectile : bukkit.entity.Projectile
---@field getItem fun(): bukkit.ItemStack
---@field setItem fun(item: bukkit.ItemStack)

---org.bukkit.entity.ThrownExpBottle
---@class bukkit.entity.ThrownExpBottle : bukkit.Entity -- TODO

---org.bukkit.entity.ThrownPotion
---@class bukkit.entity.ThrownPotion : bukkit.Entity -- TODO

---org.bukkit.entity.TippedArrow
---@class bukkit.entity.TippedArrow : bukkit.Entity -- TODO

---org.bukkit.entity.TNTPrimed
---@class bukkit.entity.TNTPrimed : bukkit.Entity -- TODO

---org.bukkit.entity.TraderLlama
---@class bukkit.entity.TraderLlama : bukkit.Entity -- TODO

---org.bukkit.entity.Trident
---@class bukkit.entity.Trident : bukkit.entity.Projectile -- TODO

---org.bukkit.entity.TropicalFish
---@class bukkit.entity.TropicalFish : bukkit.Entity -- TODO

---org.bukkit.entity.Turtle
---@class bukkit.entity.Turtle : bukkit.Entity -- TODO

---org.bukkit.entity.Vehicle
---@class bukkit.entity.Vehicle : bukkit.Entity
---@field getVelocity fun(): bukkit.Vector
---@field setVelocity fun(value: bukkit.Vector)

---org.bukkit.entity.Vex
---@class bukkit.entity.Vex : bukkit.Entity -- TODO

---org.bukkit.entity.Villager
---@class bukkit.entity.Villager : bukkit.Entity -- TODO

---org.bukkit.entity.Vindicator
---@class bukkit.entity.Vindicator : bukkit.Entity -- TODO

---org.bukkit.entity.WanderingTrader
---@class bukkit.entity.WanderingTrader : bukkit.Entity -- TODO

---org.bukkit.entity.Warden
---@class bukkit.entity.Warden : bukkit.Entity -- TODO

---org.bukkit.entity.WaterMob
---@class bukkit.entity.WaterMob : bukkit.Entity -- TODO

---org.bukkit.entity.WindCharge
---@class bukkit.entity.WindCharge : bukkit.Entity -- TODO

---org.bukkit.entity.Witch
---@class bukkit.entity.Witch : bukkit.Entity -- TODO

---org.bukkit.entity.Wither
---@class bukkit.entity.Wither : bukkit.Entity -- TODO

---org.bukkit.entity.WitherSkeleton
---@class bukkit.entity.WitherSkeleton : bukkit.Entity -- TODO

---org.bukkit.entity.WitherSkull
---@class bukkit.entity.WitherSkull : bukkit.Entity -- TODO

---org.bukkit.entity.Wolf
---@class bukkit.entity.Wolf : bukkit.Entity -- TODO

---org.bukkit.entity.Zoglin
---@class bukkit.entity.Zoglin : bukkit.Entity -- TODO

---org.bukkit.entity.Zombie
---@class bukkit.entity.Zombie : bukkit.Entity -- TODO

---org.bukkit.entity.ZombieHorse
---@class bukkit.entity.ZombieHorse : bukkit.Entity -- TODO

---org.bukkit.entity.ZombieVillager
---@class bukkit.entity.ZombieVillager : bukkit.Entity -- TODO
