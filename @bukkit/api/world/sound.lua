--#region Sound
local Sound = import("org.bukkit.Sound")

---@param v bukkit.Sound|any
function bukkit.isSound(v) return instanceof(v, Sound) end

---@param id bukkit.SoundLike
---@return bukkit.Sound?
function bukkit.sound(id)
    if bukkit.isSound(id) then ---@cast id bukkit.Sound
        return id
    end ---@cast id bukkit.NamespacedKeyLike|bukkit.Sound*
    local sound
    pcall(function() sound = Sound.valueOf(id) end)
    return sound
end

--#endregion

--#region SoundCategory
local SoundCategory = import("org.bukkit.SoundCategory")

---@param v bukkit.SoundCategory|any
function bukkit.isSoundCategory(v) return instanceof(v, SoundCategory) end

---@param id bukkit.SoundCategoryLike
---@return bukkit.SoundCategory?
function bukkit.soundCategory(id)
    if bukkit.isSoundCategory(id) then ---@cast id bukkit.SoundCategory
        return id
    end ---@cast id bukkit.SoundCategory*
    if type(id) == "string" then
        id = id:upper()
    end
    local v = java.enumValueOf(SoundCategory, id)

    -- FIX: "player" -> "PLAYERS"
    if v == nil then v = java.enumValueOf(SoundCategory, id.."S") end

    return v
end

--#endregion

-- TODO
---@class bukkit.SoundGroup : java.Object

--#region Builder

---@class bukkit.SoundBuilder : std.io.Cloneable, std.io.Applyable
---@field private _type string
---@field private _volume java.float #range(0, numbers.i32.limit)
---@field private _pitch java.float #range(-1, 1)
---@field private _seed java.long?
local SoundBuilder = {
    ---@private
    _source = bukkit.soundCategory("master")
}
SoundBuilder.__index = SoundBuilder

---@return bukkit.SoundBuilder
function SoundBuilder:clone()
    return setmetatable(table.clone(self), SoundBuilder)
end

---@param fn fun(th: bukkit.SoundBuilder)
---@return self
function SoundBuilder:apply(fn)
    fn(self)
    return self
end

---@param target bukkit.Location|adventure.audience.Audience
function SoundBuilder:play(target)
    -- TODO
    bukkit.playSound(
    ---@diagnostic disable-next-line: param-type-mismatch
        target,
        self._type,
        self._volume,
        self._pitch,
        self._source,
        self._seed
    )
end

-- TODO
---@param target bukkit.entity.Player
function SoundBuilder:to(target)
    return self
end

---@param v bukkit.SoundCategoryLike
---@return self
function SoundBuilder:source(v)
    self._source = bukkit.soundCategory(v)
    return self
end

---@param v java.float #range(0, numbers.i32.limit)
---@return self
function SoundBuilder:volume(v)
    self._volume = v
    return self
end

---@param v java.float #range(-1, 1)
---@return self
function SoundBuilder:pitch(v)
    self._pitch = v
    return self
end

---@param v java.long?
---@return self
function SoundBuilder:seed(v)
    self._seed = v
    return self
end

---@param type bukkit.Sound*
---@return bukkit.SoundBuilder
function bukkit.soundBuilder(type)
    return setmetatable({ _type = type }, SoundBuilder)
end

--#endregion
