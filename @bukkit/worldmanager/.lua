local fs = require("@base/fs")
local Creator = require("@bukkit/worldmanager/Creator")


---```lua
---paman.need("bukkit/worldmanager")
---```
local this = {
    Creator = Creator
}

---
---@param name string
---@return bukkit.World
function this.get(name)
    return bukkit.Bukkit.getWorld(name)
end

---
---@param name string
---@return boolean
function this.has(name)
    return this.get(name) ~= nil
end

---
---@param name string
---@return bukkit.worldmanager.Creator
function this.create(name)
    return Creator.new(name)
end

---
---@param name string
---@param save boolean
---@return boolean success
function this.unload(name, save)
    return bukkit.Bukkit.unloadWorld(name, save)
end

---
---@param world bukkit.World
---@param save boolean
---@return boolean success
function this.unloadWorld(world, save)
    return bukkit.Bukkit.unloadWorld(world, save)
end

---
---@param name string
---@return boolean success
function this.delete(name)
    local world = this.get(name)
    if world == nil then return true end
    return this.unloadWorld(world, false) and fs.remove(world.getWorldFolder())
end

bukkit.worldManager = this
