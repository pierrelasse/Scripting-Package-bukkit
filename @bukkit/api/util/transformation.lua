local Quaternionf = import("org.joml.Quaternionf")
local Vector3f = import("org.joml.Vector3f")
local Transformation = import("org.bukkit.util.Transformation")


---org.bukkit.util.Transformation
---@class bukkit.Transformation : java.Object
---@field getTranslation fun(): java.Object
---@field getLeftRotation fun(): java.Object
---@field getScale fun(): java.Object
---@field getRightRotation fun(): java.Object

---@class bukkit.TransformationOpts
---@field translateX? number
---@field translateY? number
---@field translateZ? number
---@field rotX? number  -- degrees
---@field rotY? number  -- degrees
---@field rotZ? number  -- degrees
---@field scaleX? number
---@field scaleY? number
---@field scaleZ? number
---@field postRotX? number  -- degrees after scaling
---@field postRotY? number  -- degrees after scaling
---@field postRotZ? number  -- degrees after scaling

---@param t bukkit.TransformationOpts|bukkit.Transformation
---@return bukkit.Transformation
function bukkit.transformation(t)
    if instanceof(t, Transformation) then ---@cast t bukkit.Transformation
        return t
    end

    local tx = t.translateX or 0
    local ty = t.translateY or 0
    local tz = t.translateZ or 0
    local sx = t.scaleX or 1
    local sy = t.scaleY or 1
    local sz = t.scaleZ or 1

    local qL = Quaternionf()
    qL.rotateXYZ(
        math.rad(t.rotX or 0),
        math.rad(t.rotY or 0),
        math.rad(t.rotZ or 0)
    )

    local qR = Quaternionf()
    qR.rotateXYZ(
        math.rad(t.postRotX or 0),
        math.rad(t.postRotY or 0),
        math.rad(t.postRotZ or 0)
    )

    return Transformation(
        Vector3f(tx, ty, tz), -- transformation
        qL,                   -- left rotation
        Vector3f(sx, sy, sz), -- scale
        qR                    -- right rotation
    )
end
