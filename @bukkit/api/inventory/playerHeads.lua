local UUID = import("java.util.UUID")

local json = require("@base/json")
local base64 = require("@core/base64")


local this = {
    URL_PREFIX = "http://textures.minecraft.net/texture/"
}

---@param t core.base64
---@return string
function this.textureIdFromBase64(t)
    if not base64.is(t) then return t end
    local s = base64.decode(t)
    local j = json.decode(s) ---@type { textures: { SKIN: { url: string } } }
    return j.textures.SKIN.url:sub(#this.URL_PREFIX + 1)
end

local PlayerProfile = importOrNil("org.bukkit.profile.PlayerProfile")
if PlayerProfile then
    local URI = import("java.net.URI")

    ---@param textureId string
    ---@return java.Object
    function this.profileFor(textureId)
        if type(textureId) ~= "string" then error("invalid textureId") end

        local profile = bukkit.Bukkit.createProfileExact(UUID(0, 0), "")
        local textures = profile.getTextures()
        textures.setSkin(URI.create(this.URL_PREFIX..textureId).toURL())
        profile.setTextures(textures)
        return profile
    end
else
    local GameProfile = import("com.mojang.authlib.GameProfile")
    local Property = import("com.mojang.authlib.properties.Property")

    ---@param textureId string
    ---@return java.Object
    function this.profileFor(textureId)
        if type(textureId) ~= "string" then error("invalid textureId") end

        local profile = GameProfile(UUID(0, 0), "")

        local properties
        pcall(function() properties = profile.properties().delegate() end)
        if properties == nil then pcall(function() properties = profile.properties end) end
        if properties == nil then error("failed to get properties") end

        properties.put("textures", Property("textures", textureId))

        return profile
    end
end

local ResolvableProfile = importOrNil("net.minecraft.world.item.component.ResolvableProfile")

---@param itemMeta java.Object
---@param profile java.Object
function this.skullMeta(itemMeta, profile)
    if ResolvableProfile ~= nil then
        local ok = false

        pcall(function()
            itemMeta.profile = profile.buildResolvableProfile()
            ok = true
        end)
        if ok then return end

        pcall(function()
            itemMeta.profile = ResolvableProfile(profile.buildGameProfile())
            ok = true
        end)
        if ok then return end
    end

    itemMeta.profile = profile
end

---@param blockState bukkit.block.BlockState
---@param profile java.Object
function this.blockState(blockState, profile)
    local ok = false

    pcall(function()
        blockState.setOwnerProfile(profile)
        ok = true
    end)
    if ok then return end

    if ResolvableProfile ~= nil then
        pcall(function()
            blockState.profile = profile.buildResolvableProfile()
            ok = true
        end)
        if ok then return end

        pcall(function()
            blockState.profile = ResolvableProfile(profile.buildGameProfile())
            ok = true
        end)
        if ok then return end
    end

    blockState.profile = profile
end

return this
