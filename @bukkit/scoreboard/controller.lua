local PlayerQuitEvent = import("org.bukkit.event.player.PlayerQuitEvent")


---Used for controlling player scoreboard instances.
---```lua
---paman.need("bukkit/scoreboard/controller")
---```
local this = {}

this.mainBoard = bukkit.scoreboard.getMain()

---uuid -> scoreboard
this.cache = makeMap() ---@type java.Map<string, bukkit.scoreboard.Scoreboard>

---@param player java.Object
---@param create? boolean=`true`
function this.get(player, create)
    local id = bukkit.uuid(player)
    ---@type bukkit.scoreboard.Scoreboard?
    local board = this.cache.get(id)
    if board == nil and create ~= false then
        board = bukkit.scoreboard.getNew()
        this.cache.put(id, board)
        player.setScoreboard(board)
    end
    return board
end

---@param player java.Object
function this.delete(player)
    local id = bukkit.uuid(player)
    if this.cache.remove(id) ~= nil then
        player.setScoreboard(this.mainBoard)
    end
end

function this.deleteAll()
    for p in bukkit.playersLoop() do
        this.delete(p)
    end
    this.cache.clear()
end

events.onStopping(this.deleteAll)

events.listen(PlayerQuitEvent, function(event)
    this.delete(event.getPlayer())
end)

bukkit.scoreboard.controller = this
