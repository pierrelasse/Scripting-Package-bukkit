scripting.warningDeprecated("bukkit/guimaker/guimaker")
return {
    new = function(...)
        scripting.warningDeprecated("bukkit/guimaker/guimaker#new")
        require("@bukkit/guimaker/")
        return require("@bukkit/guimaker/GUI").new(...)
    end
}
