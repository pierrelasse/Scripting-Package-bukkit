---@class bukkit.permissions.Permissible : bukkit.permissions.ServerOperator
---@field isPermissionSet fun(v: string|bukkit.permissions.Permission): boolean
---@field hasPermission fun(v: string|bukkit.permissions.Permission): boolean
---@field addAttachment fun(plugin: java.Object, name?: string, value?: boolean, ticks: integer): bukkit.permissions.PermissionAttachment
---@field removeAttachment fun(v: bukkit.permissions.PermissionAttachment)
---@field recalculatePermissions fun()
---@field getEffectivePermissions fun(): java.Set<bukkit.permissions.PermissionAttachmentInfo>

---@class bukkit.permissions.Permission : java.Object
---@field getName fun(): string
---@field getChildren fun(): java.Map<string, boolean>
---@field getDefault fun(): java.Object -- TODO
---@field setDefault fun(v: java.Object) -- TODO
---@field getDescription fun(): string
---@field setDescription fun(): string
---@field getPermissibles fun(): java.Set<bukkit.permissions.Permissible>
---@field recalculatePermissibles fun()
---@field addParent fun(v: string|bukkit.permissions.Permission, value: boolean): bukkit.permissions.Permission
-- TODO

---@class bukkit.permissions.PermissionAttachment : java.Object
-- TODO

---@class bukkit.permissions.PermissionAttachmentInfo : java.Object
-- TODO

---@class bukkit.permissions.ServerOperator : java.Object
---@field isOp fun(): boolean
---@field setOp fun(v: boolean)
