local ChatMessageType = import("net.md_5.bungee.api.ChatMessageType")


---@param player java.Object|adventure.audience.Audience
---@param v string|java.array<string>|adventure.text.Component
function bukkit.send(player, v)
    if adventure ~= nil then
        adventure.send.message(player, comp.from(v))
        return
    end

    if type(v) == "string" then
        player.spigot().sendMessage(bukkit.components.parse(v))
        return
    end

    scripting.warning("bukkit.send: couldn't handle")
end

---@param player bukkit.entity.Player
---@param v string|java.Object|adventure.text.Component
function bukkit.sendActionBar(player, v)
    if adventure ~= nil then
        adventure.send.actionBar(player, comp.from(v))
        return
    end

    if type(v) == "string" then
        player.spigot().sendMessage(ChatMessageType.ACTION_BAR, bukkit.components.parse(v))
        return
    end

    scripting.warning("bukkit.sendActionBar: couldn't handle")
end

---@param player bukkit.entity.Player
---@param title? string
---@param subtitle? string
---@param fadeIn? integer
---@param stay? integer
---@param fadeOut? integer
function bukkit.sendTitle(player, title, subtitle, fadeIn, stay, fadeOut)
    if adventure ~= nil then
        adventure.send.title(
            player,
            title ~= nil and comp.from(title) or nil,
            subtitle ~= nil and comp.from(subtitle) or nil,
            (fadeIn ~= nil and stay ~= nil and fadeOut ~= nil)
            and adventure.titleTimes(fadeIn, stay, fadeOut)
            or nil
        )
        return
    end

    if title ~= nil then title = bukkit.components.convertHex(title) end
    if subtitle ~= nil then subtitle = bukkit.components.convertHex(subtitle) end
    if fadeIn == nil then
        player.sendTitle(title, subtitle)
    else
        player.sendTitle(title, subtitle, fadeIn, stay, fadeOut)
    end
end
