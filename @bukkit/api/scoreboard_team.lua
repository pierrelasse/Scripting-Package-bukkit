local Team_Option = import("org.bukkit.scoreboard.Team$Option")
local Team_OptionStatus = import("org.bukkit.scoreboard.Team$OptionStatus")

local this = {}

---@class bukkit.scoreboard.Team : java.Object
---@field getName fun(): string
---@field getDisplayName fun(): string
---@field setDisplayName fun(displayName: string)
---@field getPrefix fun(): string
---@field setPrefix fun(prefix: string)
---@field getSuffix fun(): string
---@field setSuffix fun(suffix: string)
---@field getColor fun(): java.Object -- # org.bukkit.ChatColor
---@field setColor fun(color: java.Object) -- # org.bukkit.ChatColor
---@field allowFriendlyFire fun(): boolean
---@field setAllowFriendlyFire fun(enabled: boolean)
---@field canSeeFriendlyInvisibles fun(): boolean
---@field setCanSeeFriendlyInvisibles fun(enabled: boolean)
---@field getNameTagVisibility fun(): java.Object -- # org.bukkit.scoreboard.NameTagVisibility
---@field setNameTagVisibility fun(visibility: java.Object) -- # org.bukkit.scoreboard.NameTagVisibility
---@field getPlayers fun(): table<java.Object> -- # org.bukkit.OfflinePlayer
---@field getEntries fun(): table<string>
---@field getSize fun(): number
---@field getScoreboard fun(): java.Object -- # org.bukkit.scoreboard.Scoreboard
---@field addEntry fun(entry: string)
---@field removeEntry fun(entry: string): boolean
---@field unregister fun()
---@field hasEntry fun(entry: string): boolean
---@field getOption fun(option: java.Object): java.Object -- # org.bukkit.scoreboard.OptionStatus
---@field setOption fun(option: java.Object, status: java.Object)

---@alias bukkit.scoreboard.Team.Option string
---| "NAME_TAG_VISIBILITY"
---| "DEATH_MESSAGE_VISIBILITY"
---| "COLLISION_RULE"

---@param name bukkit.scoreboard.Team.Option
---@return java.Object # org.bukkit.scoreboard.Team$Option
function this.option(name)
    if type(name) ~= "string" then return name end
    return Team_Option[name]
end

---@alias bukkit.scoreboard.Team.OptionStatus string
---| "ALWAYS"
---| "NEVER"
---| "FOR_OTHER_TEAMS"
---| "FOR_OWN_TEAM"

---@param name bukkit.scoreboard.Team.OptionStatus
---@return java.Object # org.bukkit.scoreboard.Team$OptionStatus
function this.optionStatus(name)
    if type(name) ~= "string" then return name end
    return Team_OptionStatus[name]
end

bukkit.scoreboard.team = this
