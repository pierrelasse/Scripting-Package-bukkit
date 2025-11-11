local WorldCreator = import("org.bukkit.WorldCreator")
local World_Environment = import("org.bukkit.World$Environment")
local WorldType = import("org.bukkit.WorldType")
local VoidWorldGenerator


---@class bukkit.worldmanager.Creator
---@field worldCreator java.Object
local this = {}
this.__index = this

---@class worldmanager.Creator.Environment
this.Environment = {
    NORMAL = 0,
    NETHER = -1,
    THE_END = 1,
    CUSTOM = -999
}

---@class worldmanager.Creator.Type
this.Type = {
    NORMAL = "DEFAULT",
    FLAT = "FLAT",
    LARGE_BIOMES = "LARGEBIOMES",
    AMPLIFIED = "AMPLIFIED"
}

function this.new(name)
    local self = setmetatable({}, this)
    self.worldCreator = WorldCreator(name)
    return self
end

---@return number seed
function this:getSeed()
    return self.worldCreator.seed()
end

---@param seed number
function this:setSeed(seed)
    self.worldCreator.seed(seed)
end

---@return number environment
function this:getEnvironment()
    return self.worldCreator.environment()
end

---@param environment number
function this:setEnvironment(environment)
    self.worldCreator.environment(World_Environment.getEnvironment(environment))
end

---@return string type
function this:getType()
    return self.worldCreator.type()
end

---@param type string
function this:setType(type)
    self.worldCreator.type(WorldType.getByName(type))
end

---@return java.Object|nil generator
function this:getGenerator()
    return self.worldCreator.generator()
end

---@param generator java.Object|nil org.bukkit.generator.ChunkGenerator
function this:setGenerator(generator)
    self.worldCreator.generator(generator)
end

---@return java.Object|nil biomeProvider org.bukkit.generator.BiomeProvider
function this:getBiomeProvider()
    return self.worldCreator.biomeProvider()
end

---@param biomeProvider java.Object|nil org.bukkit.generator.BiomeProvider
function this:setBiomeProvider(biomeProvider)
    self.worldCreator.biomeProvider(biomeProvider)
end

---@return string
function this:getGeneratorSettings()
    return self.worldCreator.generatorSettings()
end

---@param generatorSettings string
function this:setGeneratorSettings(generatorSettings)
    self.worldCreator.generatorSettings(generatorSettings)
end

---@return boolean
function this:getGenerateStructures()
    return self.worldCreator.generateStructures()
end

---@param generate boolean
function this:setGenerateStructures(generate)
    self.worldCreator.generateStructures(generate)
end

---@return boolean
function this:getHardcore()
    return self.worldCreator.hardcore()
end

---@param hardcore boolean
function this:setHardcore(hardcore)
    self.worldCreator.hardcore(hardcore)
end

---@return boolean
function this:getKeepSpawnInMemory()
    return self.worldCreator.keepSpawnInMemory()
end

---@param keepSpawnInMemory boolean
function this:setKeepSpawnInMemory(keepSpawnInMemory)
    self.worldCreator.keepSpawnInMemory(keepSpawnInMemory)
end

---Makes the world a void world
---@return { biome: java.Object }
function this:setupVoid()
    if VoidWorldGenerator == nil then
        classloader.addClassFile("@bukkit/worldmanager", "bukkit_worldmanager_VoidWorldGenerator")
        classloader.addClassFile("@bukkit/worldmanager", "bukkit_worldmanager_VoidWorldGenerator$1")

        VoidWorldGenerator = import("bukkit_worldmanager_VoidWorldGenerator")
    end

    local generator = VoidWorldGenerator()
    self:setGenerator(generator)
    return generator
end

---@return bukkit.World
function this:create()
    return self.worldCreator.createWorld()
end

return this
