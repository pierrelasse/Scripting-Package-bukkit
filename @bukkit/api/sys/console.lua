---@return bukkit.ConsoleCommandSender
function bukkit.consoleSender() return bukkit.Bukkit.getConsoleSender() end

---Executes a command as the console.
---**Example:**
---```lua
---bukkit.consoleCommand("say foo")
---```
---@param command string
function bukkit.consoleCommand(command)
    bukkit.Bukkit.dispatchCommand(bukkit.consoleSender(), command)
end

---@deprecated
---@param v string
function bukkit.printConsole(v)
    ---@diagnostic disable-next-line: param-type-mismatch
    bukkit.consoleSender().sendMessage(v)
end
