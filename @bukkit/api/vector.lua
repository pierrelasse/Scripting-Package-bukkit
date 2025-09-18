local Vector = import("org.bukkit.util.Vector")


---@class bukkit.Vector : java.Object, {
--- add: fun(vec: bukkit.Vector): bukkit.Vector;
--- subtract: fun(vec: bukkit.Vector): bukkit.Vector;
--- multiply: fun(o: bukkit.Vector | number): bukkit.Vector;
--- divide: fun(vec: bukkit.Vector): bukkit.Vector;
--- copy: fun(vec: bukkit.Vector): bukkit.Vector;
--- length: fun(): number;
--- lengthSquared: fun(): number;
--- distance: fun(other: bukkit.Vector): number;
--- distanceSquared: fun(other: bukkit.Vector): number;
--- angle: fun(other: bukkit.Vector): number;
--- midpoint: fun(other: bukkit.Vector): bukkit.Vector;
--- getMidpoint: fun(other: bukkit.Vector): bukkit.Vector;
--- dot: fun(other: bukkit.Vector): bukkit.Vector;
--- crossProduct: fun(o: bukkit.Vector): bukkit.Vector;
--- getCrossProduct: fun(o: bukkit.Vector): bukkit.Vector;
--- normalize: fun(): bukkit.Vector;
--- zero: fun(): bukkit.Vector;
--- isZero: fun(): boolean;
--- isInAABB: fun(min: bukkit.Vector, max: bukkit.Vector): boolean;
--- isInSphere: fun(origin: bukkit.Vector, radius: number): boolean;
--- isNormalized: fun(): boolean;
--- rotateAroundX: fun(angle: number): bukkit.Vector;
--- rotateAroundY: fun(angle: number): bukkit.Vector;
--- rotateAroundAxis: fun(axis: bukkit.Vector, angle: number): bukkit.Vector;
--- rotateAroundNonUnitAxis: fun(axis: bukkit.Vector, angle: number): bukkit.Vector;
--- getX: fun(): number;
--- getBlockX: fun(): integer;
--- getY: fun(): number;
--- getBlockY: fun(): integer;
--- getZ: fun(): number;
--- getBlockZ: fun(): integer;
--- setX: fun(x: number): bukkit.Vector;
--- setY: fun(x: number): bukkit.Vector;
--- setZ: fun(x: number): bukkit.Vector;
--- toLocation: fun(world: bukkit.World, yaw?: number, pitch?: number): bukkit.Location;
--- toBlockVector: fun(): java.Object;
--- toVector3f: fun(): java.Object;
--- toVector3d: fun(): java.Object;
---}

---@param x number
---@param y number
---@param z number
---@return bukkit.Vector
function bukkit.vector(x, y, z)
    return Vector(x, y, z)
end

---@param location bukkit.Location
---@param vector bukkit.Vector
---@return bukkit.Location
function bukkit.addVec(location, vector)
    return location
        .toVector()
        .add(vector)
        .toLocation(location.getWorld())
end
