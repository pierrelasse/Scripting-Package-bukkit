---#incomplete
function bukkit.profile()
    -- TODO
end

---#incomplete
function paper.profile()
    -- TODO
end

---@type java.Class?
local ResolvableProfile

---@param profile paper.profile.PlayerProfile
---@return paper.profile.ResolvableProfile
function paper.resolvableProfile(profile)
    if not ResolvableProfile then
        ResolvableProfile = import("io.papermc.paper.datacomponent.item.ResolvableProfile")
    end
    return ResolvableProfile.resolvableProfile(profile)
end

---@return paper.profile.ResolvableProfile.Builder
function paper.resolvableProfileBuilder()
    if not ResolvableProfile then
        ResolvableProfile = import("io.papermc.paper.datacomponent.item.ResolvableProfile")
    end
    return ResolvableProfile.resolvableProfile()
end
