scripting.warningDeprecated("bukkit/guimaker/uihelper")

local UUID = import("java.util.UUID")
local ArrayList = import("java.util.ArrayList")
local GameProfile = import("com.mojang.authlib.GameProfile")
local Property = import("com.mojang.authlib.properties.Property")
local ResolvableProfile = import("net.minecraft.world.item.component.ResolvableProfile")
local Material = import("org.bukkit.Material")
local ItemStack = import("org.bukkit.inventory.ItemStack")


return {
    ---@deprecated
    item = function(material, name, lore)
        local itemStack, meta

        if string.startsWith(material, "HEAD:") then
            itemStack = ItemStack(Material.PLAYER_HEAD)
            meta = itemStack.getItemMeta()
            local uuid = UUID.fromString("00000000-0000-0000-0000-000000000000")
            local profile = GameProfile(uuid, "")
            local texture = string.sub(material, 6)
            local property = Property("textures", texture)
            profile.getProperties().put("textures", property)
            if ResolvableProfile ~= nil then
                profile = ResolvableProfile(profile)
            end
            meta.profile = profile
        else
            itemStack = ItemStack(bukkit.material(material))
            meta = itemStack.getItemMeta()
            if meta == nil then return itemStack end
        end

        if name ~= nil then
            meta.setDisplayName(name)
        end

        if lore ~= nil then
            local list = ArrayList()
            for _, line in ipairs(lore) do list.add(line) end
            meta.setLore(list)
        end

        itemStack.setItemMeta(meta)

        return itemStack
    end
}
