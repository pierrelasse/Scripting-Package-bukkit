local ConfigurationSection = import("org.bukkit.configuration.ConfigurationSection")
local YamlConfiguration = import("org.bukkit.configuration.file.YamlConfiguration")

local fs = require("@base/fs")


---```lua
---paman.need("bukkit/Storage")
---```
---@class bukkit.Storage
---@field file java.Object java.io.File
---@field config java.Object
---@field saveCb? fun()
local this = {}
this.__index = this

---Creates new storage instance
---@param project? string
---@param name string
function this.new(project, name)
    local self = setmetatable({}, this)

    local d = "../scripting.storage/"
    if project ~= nil then d = d..project.."/" end
    local dir = fs.file(fs.scriptingDir(), d)
    dir.mkdirs()
    self.file = fs.file(dir, name..".yml")

    self.config = YamlConfiguration()

    return self
end

---@param file java.Object
function this.newAt(file)
    file.getParentFile().mkdirs()

    local self = setmetatable({}, this)

    self.file = file
    self.config = YamlConfiguration()

    return self
end

---Load from file
function this:load()
    if self.file.isFile() then
        self.config.load(self.file)
    end
end

---Save to file
function this:save()
    if self.saveCb ~= nil then self.saveCb() end

    if self.file.isFile() or not self.file.exists() then
        self.config.save(self.file)
    end
end

---Load and register a stop listener that saves
---@param saveCb? function
---@return self
function this:loadSave(saveCb)
    self:load()
    self.saveCb = saveCb
    events.onStopping(function() self:save() end)
    return self
end

---@param path string
function this:has(path)
    return self.config.isSet(path) == true
end

---@param path string
---@param def any?
---@return unknown
function this:get(path, def)
    if def == nil then
        return self.config.get(path)
    else
        return self.config.get(path, def)
    end
end

---@param path string
---@param value any
function this:set(path, value)
    self.config.set(path, value)
end

---@param path string
---@return java.List<any>
function this:getList(path)
    local list = self.config.getList(path)
    if list == nil then
        list = makeList()
        self.config.set(path, list)
    end
    return list
end

---@param path string
---@return java.Set<string>?
function this:getKeys(path)
    local section = self.config.getConfigurationSection(path)
    if section ~= nil then
        return section.getKeys(false)
    end
end

---@param path string
function this:loopKeys(path)
    local keys = self:getKeys(path)
    if keys == nil then return function() return nil, 0 end end
    return forEach(keys)
end

---@param path string
---@return unknown?
function this:getValues(path)
    local section = self.config.getConfigurationSection(path)
    if section ~= nil then
        return section.getValues(false)
    end
end

---@param path string
function this:clearIfEmpty(path)
    local keys = self:getKeys(path)
    if keys ~= nil and keys.size() == 0 then
        self:set(path, nil)
    end
end

---@param path string
function this:getSection(path)
    local section = self.config.get(path)
    if section == nil then
        section = self.config.createSection(path)
    elseif not instanceof(section, ConfigurationSection) then
        error("'"..path.."' is not a ConfigurationSection")
    end
    return section
end

---@param path string
function this:getSectionOrNil(path)
    local section = self.config.get(path)
    if instanceof(section, ConfigurationSection) then
        return section
    end
end

bukkit.Storage = this
return this
