---@return java.Object
function bukkit.consoleSender()
    return bukkit.Bukkit.getConsoleSender()
end

---Executes a command as the console.
---**Example:**
---```lua
---bukkit.consoleCommand("say foo")
---```
---@param command string
function bukkit.consoleCommand(command)
    bukkit.Bukkit.dispatchCommand(bukkit.Bukkit.getConsoleSender(), command)
end

---@param message string
function bukkit.printConsole(message)
    bukkit.consoleSender().sendMessage(message)
end
