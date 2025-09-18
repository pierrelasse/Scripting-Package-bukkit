local BarColor = import("org.bukkit.boss.BarColor")
local BarFlag = import("org.bukkit.boss.BarFlag")
local BarStyle = import("org.bukkit.boss.BarStyle")


---@alias bukkit.boss.BarColor* string
---| "PINK"
---| "BLUE"
---| "RED"
---| "GREEN"
---| "YELLOW"
---| "PURPLE"
---| "WHITE"

---org.bukkit.boss.BarColor
---@class bukkit.boss.BarColor : java.Object

---@param name bukkit.boss.BarColor*|bukkit.boss.BarColor
function bukkit.barColor(name)
    if type(name) ~= "string" then return name end
    return BarColor.valueOf(name)
end

---@alias bukkit.boss.BarFlag* string
---| "DARKEN_SKY"
---| "PLAY_BOSS_MUSIC"
---| "CREATE_FOG"

---org.bukkit.boss.BarFlag
---@class bukkit.boss.BarFlag : java.Object

---@param name bukkit.boss.BarFlag*|bukkit.boss.BarFlag
function bukkit.barFlag(name)
    if type(name) ~= "string" then return name end
    return BarFlag.valueOf(name)
end

---@alias bukkit.boss.BarStyle* string
---| "SOLID"
---| "SEGMENTED_6"
---| "SEGMENTED_10"
---| "SEGMENTED_12"
---| "SEGMENTED_20"

---org.bukkit.boss.BarStyle
---@class bukkit.boss.BarStyle : java.Object

---@param name bukkit.boss.BarStyle*|bukkit.boss.BarStyle
function bukkit.barStyle(name)
    if type(name) ~= "string" then return name end
    return BarStyle.valueOf(name)
end

---org.bukkit.boss.BossBar
---@class bukkit.boss.BossBar : java.Object
---@field getTitle fun(): string
---@field setTitle fun(title: string)
---@field getColor fun(): bukkit.boss.BarColor
---@field setColor fun(color: bukkit.boss.BarColor)
---@field getStyle fun(): bukkit.boss.BarStyle
---@field setStyle fun(style: bukkit.boss.BarStyle)
---@field removeFlag fun(flag: bukkit.boss.BarFlag)
---@field addFlag fun(flag: bukkit.boss.BarFlag)
---@field hasFlag fun(flag: bukkit.boss.BarFlag): boolean
---@field getProgress fun(): number
---@field setProgress fun(progress: number)
---@field addPlayer fun(player: bukkit.entity.Player)
---@field removePlayer fun(player: bukkit.entity.Player)
---@field removeAll fun()
---@field getPlayers fun(): java.List<bukkit.entity.Player>
---@field setvisible fun(visible: boolean)

-- TODO: creator

---@class bukkit.boss.KeyedBossBar : bukkit.boss.BossBar, bukkit.Keyed

-- TODO
function bukkit.createBossBar()

end
