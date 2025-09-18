local Effect = import("org.bukkit.Effect")


---@alias bukkit.Effect* string
---| "CLICK2" -- 1000, Type.SOUND
---| "CLICK1" -- 1001, Type.SOUND
---| "BOW_FIRE" -- 1002, Type.SOUND
---| "DOOR_TOGGLE" -- 1006, Type.SOUND @Deprecated(since = "1.19.3")
---| "IRON_DOOR_TOGGLE" -- 1005, Type.SOUND @Deprecated(since = "1.19.3")
---| "TRAPDOOR_TOGGLE" -- 1007, Type.SOUND @Deprecated(since = "1.19.3")
---| "IRON_TRAPDOOR_TOGGLE" -- 1037, Type.SOUND @Deprecated(since = "1.19.3")
---| "FENCE_GATE_TOGGLE" -- 1008, Type.SOUND @Deprecated(since = "1.19.3")
---| "DOOR_CLOSE" -- 1012, Type.SOUND @Deprecated(since = "1.19.3")
---| "IRON_DOOR_CLOSE" -- 1011, Type.SOUND @Deprecated(since = "1.19.3")
---| "TRAPDOOR_CLOSE" -- 1013, Type.SOUND @Deprecated(since = "1.19.3")
---| "IRON_TRAPDOOR_CLOSE" -- 1036, Type.SOUND @Deprecated(since = "1.19.3")
---| "FENCE_GATE_CLOSE" -- 1014, Type.SOUND @Deprecated(since = "1.19.3")
---| "EXTINGUISH" -- 1009, Type.SOUND
---| "RECORD_PLAY" -- 1010, TypeSOUND, Material.class
---| "GHAST_SHRIEK" -- 1015, Type.SOUND
---| "GHAST_SHOOT" -- 1016, Type.SOUND
---| "BLAZE_SHOOT" -- 1018, Type.SOUND
---| "ZOMBIE_CHEW_WOODEN_DOOR" -- 1019, Type.SOUND
---| "ZOMBIE_CHEW_IRON_DOOR" -- 1020, Type.SOUND
---| "ZOMBIE_DESTROY_DOOR" -- 1021, Type.SOUND
---| "SMOKE" -- 2000, TypeVISUAL, BlockFace.class
---| "STEP_SOUND" -- 2001, TypeSOUND, Material.class
---| "POTION_BREAK" -- 2002, TypeVISUAL, Color.class
---| "INSTANT_POTION_BREAK" -- 2007, TypeVISUAL, Color.class
---| "ENDER_SIGNAL" -- 2003, Type.VISUAL
---| "MOBSPAWNER_FLAMES" -- 2004, Type.VISUAL
---| "BREWING_STAND_BREW" -- 1035, Type.SOUND
---| "CHORUS_FLOWER_GROW" -- 1033, Type.SOUND
---| "CHORUS_FLOWER_DEATH" -- 1034, Type.SOUND
---| "PORTAL_TRAVEL" -- 1032, Type.SOUND
---| "ENDEREYE_LAUNCH" -- 1003, Type.SOUND
---| "FIREWORK_SHOOT" -- 1004, Type.SOUND
---| "VILLAGER_PLANT_GROW" -- 2005, TypeVISUAL, Integer.class
---| "DRAGON_BREATH" -- 2006, Type.VISUAL
---| "ANVIL_BREAK" -- 1029, Type.SOUND
---| "ANVIL_USE" -- 1030, Type.SOUND
---| "ANVIL_LAND" -- 1031, Type.SOUND
---| "ENDERDRAGON_SHOOT" -- 1017, Type.SOUND
---| "WITHER_BREAK_BLOCK" -- 1022, Type.SOUND
---| "WITHER_SHOOT" -- 1024, Type.SOUND
---| "ZOMBIE_INFECT" -- 1026, Type.SOUND
---| "ZOMBIE_CONVERTED_VILLAGER" -- 1027, Type.SOUND
---| "BAT_TAKEOFF" -- 1025, Type.SOUND
---| "END_GATEWAY_SPAWN" -- 3000, Type.VISUAL
---| "ENDERDRAGON_GROWL" -- 3001, Type.SOUND
---| "PHANTOM_BITE" -- 1039, Type.SOUND
---| "ZOMBIE_CONVERTED_TO_DROWNED" -- 1040, Type.SOUND
---| "HUSK_CONVERTED_TO_ZOMBIE" -- 1041, Type.SOUND
---| "GRINDSTONE_USE" -- 1042, Type.SOUND
---| "BOOK_PAGE_TURN" -- 1043, Type.SOUND
---| "SMITHING_TABLE_USE" -- 1044, Type.SOUND
---| "POINTED_DRIPSTONE_LAND" -- 1045, Type.SOUND
---| "POINTED_DRIPSTONE_DRIP_LAVA_INTO_CAULDRON" -- 1046, Type.SOUND
---| "POINTED_DRIPSTONE_DRIP_WATER_INTO_CAULDRON" -- 1047, Type.SOUND
---| "SKELETON_CONVERTED_TO_STRAY" -- 1048, Type.SOUND
---| "COMPOSTER_FILL_ATTEMPT" -- 1500, TypeVISUAL, Boolean.class
---| "LAVA_INTERACT" -- 1501, Type.VISUAL
---| "REDSTONE_TORCH_BURNOUT" -- 1502, Type.VISUAL
---| "END_PORTAL_FRAME_FILL" -- 1503, Type.VISUAL
---| "DRIPPING_DRIPSTONE" -- 1504, Type.VISUAL
---| "BONE_MEAL_USE" -- 1505, TypeVISUAL, Integer.class
---| "ENDER_DRAGON_DESTROY_BLOCK" -- 2008, Type.VISUAL
---| "SPONGE_DRY" -- 2009, Type.VISUAL
---| "ELECTRIC_SPARK" -- 3002, TypeVISUAL, Axis.class
---| "COPPER_WAX_ON" -- 3003, Type.VISUAL
---| "COPPER_WAX_OFF" -- 3004, Type.VISUAL
---| "OXIDISED_COPPER_SCRAPE" -- 3005, Type.VISUAL

---@param name bukkit.Effect*|java.Object
---@return java.Object effect org.bukkit.Effect
function bukkit.effect(name)
    if type(name) ~= "string" then return name end
    return Effect.valueOf(name)
end
