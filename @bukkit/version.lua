local this = {
    VERSION = {}
}

---@private
function this.init()
    local str = bukkit.Bukkit.getBukkitVersion()
    local version = string.sub(str, 0, string.find(str, "-") - 1)

    local i = 0
    for part in forEach(version:split(".")) do
        local num = tonumber(part)
        if num ~= nil then
            i = i + 1
            this.VERSION[i] = num
        end
    end
end

this.init()

---@param major number
---@param minor number
---@param patch number
---@return boolean
function this.before(major, minor, patch)
    if this.VERSION[1] < major then
        return true
    elseif this.VERSION[1] == major then
        if this.VERSION[2] < minor then
            return true
        elseif this.VERSION[2] == minor and this.VERSION[3] < patch then
            return true
        end
    end
    return false
end

---@param major number
---@param minor number
---@param patch number
---@return boolean
function this.is(major, minor, patch)
    return this.VERSION[1] == major and this.VERSION[2] == minor and
        this.VERSION[3] == patch
end

---@param major number
---@param minor number
---@param patch number
---@return boolean
function this.after(major, minor, patch)
    if this.VERSION[1] > major then
        return true
    elseif this.VERSION[1] == major then
        if this.VERSION[2] > minor then
            return true
        elseif this.VERSION[2] == minor and this.VERSION[3] > patch then
            return true
        end
    end
    return false
end

---@deprecated
this.isBefore = this.before
---@deprecated
this.isAfter = this.after

bukkit.version = this
