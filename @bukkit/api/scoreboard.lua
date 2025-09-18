local Criteria = import("org.bukkit.scoreboard.Criteria")
local RenderType = import("org.bukkit.scoreboard.RenderType")
local DisplaySlot = import("org.bukkit.scoreboard.DisplaySlot")


local this = {}

---@alias bukkit.scoreboard.RenderType string
---| "INTEGER"
---| "HEARTS"

---@param name bukkit.scoreboard.RenderType|java.Object
---@return java.Object criteria org.bukkit.scoreboard.RenderType
function this.renderType(name)
    if type(name) ~= "string" then return name end
    return RenderType[name]
end

---@alias bukkit.scoreboard.Criteria string
---| "DUMMY"
---| "TRIGGER"
---| "DEATH_COUNT"
---| "PLAYER_KILL_COUNT"
---| "TOTAL_KILL_COUNT"
---| "HEALTH"
---| "FOOD"
---| "AIR"
---| "ARMOR"
---| "XP"
---| "LEVEL"
---| "TEAM_KILL_BLACK"
---| "TEAM_KILL_DARK_BLUE"
---| "TEAM_KILL_DARK_GREEN"
---| "TEAM_KILL_DARK_AQUA"
---| "TEAM_KILL_DARK_RED"
---| "TEAM_KILL_DARK_PURPLE"
---| "TEAM_KILL_GOLD"
---| "TEAM_KILL_GRAY"
---| "TEAM_KILL_DARK_GRAY"
---| "TEAM_KILL_BLUE"
---| "TEAM_KILL_GREEN"
---| "TEAM_KILL_AQUA"
---| "TEAM_KILL_RED"
---| "TEAM_KILL_LIGHT_PURPLE"
---| "TEAM_KILL_YELLOW"
---| "TEAM_KILL_WHITE"
---| "KILLED_BY_TEAM_BLACK"
---| "KILLED_BY_TEAM_DARK_BLUE"
---| "KILLED_BY_TEAM_DARK_GREEN"
---| "KILLED_BY_TEAM_DARK_AQUA"
---| "KILLED_BY_TEAM_DARK_RED"
---| "KILLED_BY_TEAM_DARK_PURPLE"
---| "KILLED_BY_TEAM_GOLD"
---| "KILLED_BY_TEAM_GRAY"
---| "KILLED_BY_TEAM_DARK_GRAY"
---| "KILLED_BY_TEAM_BLUE"
---| "KILLED_BY_TEAM_GREEN"
---| "KILLED_BY_TEAM_AQUA"
---| "KILLED_BY_TEAM_RED"
---| "KILLED_BY_TEAM_LIGHT_PURPLE"
---| "KILLED_BY_TEAM_YELLOW"
---| "KILLED_BY_TEAM_WHITE"

---@param name bukkit.scoreboard.Criteria|java.Object
---@return java.Object criteria org.bukkit.scoreboard.Criteria
function this.criteria(name)
    if type(name) ~= "string" then return name end
    return Criteria[name]
end

---@alias bukkit.scoreboard.DisplaySlot string
---| "BELOW_NAME"
---| "PLAYER_LIST"
---| "SIDEBAR"
---| "SIDEBAR_BLACK"
---| "SIDEBAR_DARK_BLUE"
---| "SIDEBAR_DARK_GREEN"
---| "SIDEBAR_DARK_AQUA"
---| "SIDEBAR_DARK_RED"
---| "SIDEBAR_DARK_PURPLE"
---| "SIDEBAR_GOLD"
---| "SIDEBAR_GRAY"
---| "SIDEBAR_DARK_GRAY"
---| "SIDEBAR_BLUE"
---| "SIDEBAR_GREEN"
---| "SIDEBAR_AQUA"
---| "SIDEBAR_RED"
---| "SIDEBAR_LIGHT_PURPLE"
---| "SIDEBAR_YELLOW"
---| "SIDEBAR_WHITE"

---@param name bukkit.scoreboard.DisplaySlot|java.Object
---@return java.Object displaySlot org.bukkit.scoreboard.DisplaySlot
function this.displaySlot(name)
    if type(name) ~= "string" then return name end
    return DisplaySlot[name]
end

---@class bukkit.scoreboard.Score : java.Object
---@field getEntry fun(): string
---@field getObjective fun(): bukkit.scoreboard.Objective
---@field getScore fun(): number
---@field setScore fun(score: number)
---@field isScoreSet fun(): boolean
---@field getScoreboard fun(): bukkit.scoreboard.Scoreboard?

---@class bukkit.scoreboard.Objective : java.Object
---@field getName fun(): string
---@field getDisplayName fun(): string
---@field setDisplayName fun(displayName: string)
---@field getTrackedCriteria fun(): java.Object
---@field isModifiable fun(): boolean
---@field getScoreboard fun(): bukkit.scoreboard.Scoreboard?
---@field unregister fun()
---@field setDisplaySlot fun(slot: java.Object?)
---@field getDisplaySlot fun(): java.Object?
---@field setRenderType fun(renderType: java.Object)
---@field getRenderType fun(): java.Object
---@field getScore fun(entry: string): bukkit.scoreboard.Score

---@class bukkit.scoreboard.Scoreboard : java.Object
---@field registerNewObjective fun(name: string, criteria: java.Object, displayName: string): bukkit.scoreboard.Objective
---@field registerNewObjective fun(name: string, criteria: java.Object, displayName: string, renderType: java.Object): bukkit.scoreboard.Objective
---@field getObjective fun(name: string): bukkit.scoreboard.Objective?
---@field getObjectivesByCriteria fun(criteria: java.Object): java.Set<bukkit.scoreboard.Objective>
---@field getObjectives fun(): java.Set<bukkit.scoreboard.Objective>
---@field getObjective fun(slot: java.Object): bukkit.scoreboard.Objective?
---@field getScores fun(entry: string): java.Set<bukkit.scoreboard.Score>
---@field resetScores fun(entry: string)
---@field getEntryTeam fun(entry: string): bukkit.scoreboard.Team?
---@field getTeam fun(teamName: string): bukkit.scoreboard.Team?
---@field getTeams fun(): java.Set<bukkit.scoreboard.Team>
---@field registerNewTeam fun(name: string): bukkit.scoreboard.Team
---@field getEntries fun(): java.Set<string>
---@field clearSlot fun(slot: java.Object)

this.manager = bukkit.Bukkit.getScoreboardManager()

---Gets the primary Scoreboard controlled by the server.
---This Scoreboard is saved by the server, is affected by the / scoreboard command, and is the<br>
---scoreboard shown by default to players.
---@return bukkit.scoreboard.Scoreboard
function this.getMain()
    return this.manager.getMainScoreboard()
end

---Gets a new Scoreboard to be tracked by the server. This scoreboard will be tracked as long as a<br>
---reference is kept, either by a player or by a plugin.
---@return bukkit.scoreboard.Scoreboard
function this.getNew()
    return this.manager.getNewScoreboard()
end

bukkit.scoreboard = this
