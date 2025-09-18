scripting.warningDeprecated("bukkit/guimaker/guimaker")
require("@bukkit/guimaker/")
return {
    new = function(...)
        scripting.warningDeprecated("bukkit/guimaker/guimaker#new")
        return require("@bukkit/guimaker/GUI").new(...)
    end
}
