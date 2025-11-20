local paper_NumberFormat = importOrNil("io.papermc.paper.scoreboard.numbers.NumberFormat")


---@class bukkit.scoreboard.sidebar.Sidebar
---@field board bukkit.scoreboard.Scoreboard
---@field objective? bukkit.scoreboard.Objective
local this = {}
this.__index = this

---Gets or creates a new Sidebar instance for a player.
---@param player bukkit.entity.Player
function this.get(player)
    local self = setmetatable({}, this)

    self.board = bukkit.scoreboard.controller.get(player)

    self.objective = self.board.getObjective("sidebar")
    if self.objective == nil then
        self.objective = self.board.registerNewObjective(
            "sidebar",
            bukkit.scoreboard.criteria("DUMMY"),
            " "
        )
        self.objective.setDisplaySlot(
            bukkit.scoreboard.displaySlot("SIDEBAR")
        )

        if paper_NumberFormat ~= nil then
            self.objective.numberFormat(paper_NumberFormat.blank())
        end
    end

    return self
end

function this:destroy()
    self.objective.unregister()
    self.objective = nil
end

---Sets the displayed title of the sidebar.
---@param title string
function this:setTitle(title)
    self.objective.setDisplayName(bukkit.hex(title))
end

---Sets the displayed title of the sidebar.
---@param v adventure.text.Component
function this:title(v)
    self.objective.setDisplayName(comp.legacySerialize(v))
end

---@param score string
---@param value number
function this:setRaw(score, value)
    if self.objective == nil then return end

    self.objective.getScore(score).setScore(value)
end

---@param line string
function this:remove(line)
    if self.objective == nil then return end

    self.board.resetScores(line)
end

function this:clear()
    if self.objective == nil then return end

    for entry in forEach(self.board.getEntries()) do
        local score = self.objective.getScore(entry)
        if score.isScoreSet() then
            self.board.resetScores(entry)
        end
    end
end

---@param text string
---@param value number
---@param id? integer=`value` order of the line
function this:set(text, value, id)
    if self.objective == nil then return end
    if id == nil then id = value end

    local score = "§"..string.format("%x", id).."§r"
    self:setRaw(score, value)

    local teamName = "s"..id
    local team = self.board.getTeam(teamName)
        or self.board.registerNewTeam(teamName)
    team.addEntry(score)
    team.setSuffix(text)
end

---@param lines string[]|java.array<string>
function this:setLines(lines)
    if self.objective == nil then return end

    for i = 1, 15 do
        local line = lines[i]
        if line == nil then
            local team = self.board.getTeam("s"..i)
            if team ~= nil then
                team.unregister()
                self:remove("§"..string.format("%x", i).."§r")
            end
        else
            self:set(bukkit.hex(line), 0, i)
        end
    end
end

---@param v java.List<adventure.text.Component>
function this:lines(v)
    if self.objective == nil then return end

    local vSize = v.size()
    for i = 1, 15 do
        if i > vSize then
            local team = self.board.getTeam("s"..i)
            if team ~= nil then
                team.unregister()
                self:remove("§"..string.format("%x", i).."§r")
            end
        else
            self:set(comp.legacySerialize(v.get(i - 1)), 0, i)
        end
    end
end

---@deprecated
function this:setScore(key, value)
    scripting.warningDeprecated("bukkit/scoreboard/Sidebar#setScore")
    self:set(bukkit.hex(key), value)
end

---@deprecated
function this:setScoreSimple(key, value)
    scripting.warningDeprecated("bukkit/scoreboard/Sidebar#setScoreSimple")
    self:setRaw(key, value)
end

---@deprecated
function this:removeScore(key)
    scripting.warningDeprecated("bukkit/scoreboard/Sidebar#removeScore")
    self.objective.getScoreboard().resetScores(key)
end

---@deprecated
function this:clearScores()
    scripting.warningDeprecated("bukkit/scoreboard/Sidebar#clearScores")
    for entry in forEach(self.board.getEntries()) do
        local score = self.objective.getScore(entry)
        if score.isScoreSet() then
            self.board.resetScores(entry)
        end
    end
end

---@deprecated
---@param scores table<string, number>
function this:setEntries(scores)
    scripting.warningDeprecated("bukkit/scoreboard/Sidebar#setEntries")
    self:setLines(table.keys(scores))
end

---@deprecated
function this:setScores(list, startingIndex)
    scripting.warningDeprecated("bukkit/scoreboard/Sidebar#setScores")
    self:setLines(list)
end

bukkit.scoreboard.Sidebar = this
return this
