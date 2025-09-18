local ChatMessageType = import("net.md_5.bungee.api.ChatMessageType")


-- TODO

---@deprecated
function bukkit.sendComponent(player, component)
    scripting.warningDeprecated("bukkit.sendComponent")
    player.spigot().sendMessage(component)
end

---@param player java.Object|bukkit.entity.Player
---@param v string|java.array<string>|adventure.text.Component
function bukkit.send(player, v)
    if type(v) == "string" then
        ---@diagnostic disable-next-line: deprecated
        bukkit.sendComponent(player, bukkit.components.parse(v))
        return
    end
    player.sendMessage(v)
end

---@deprecated
function bukkit.sendActionBarComponent(player, component)
    scripting.warningDeprecated("bukkit.sendActionBarComponent")
    player.spigot().sendMessage(ChatMessageType.ACTION_BAR, component)
end

---@param player bukkit.entity.Player
---@param v string|java.Object|adventure.text.Component
function bukkit.sendActionBar(player, v)
    if type(v) == "string" then
        if comp == nil then
            player.spigot().sendMessage(ChatMessageType.ACTION_BAR, bukkit.components.parse(v))
            return
        else
            v = comp.legacyDeserialize(comp.hex(v))
        end
    end

    player.sendActionBar(v)
end

---@param player bukkit.entity.Player
---@param title? string
---@param subtitle? string
---@param fadeIn? integer
---@param stay? integer
---@param fadeOut? integer
function bukkit.sendTitle(player, title, subtitle, fadeIn, stay, fadeOut)
    if title ~= nil then title = bukkit.components.convertHex(title) end
    if subtitle ~= nil then subtitle = bukkit.components.convertHex(subtitle) end

    if fadeIn == nil then
        player.sendTitle(title, subtitle)
    else
        player.sendTitle(title, subtitle, fadeIn, stay, fadeOut)
    end
end
