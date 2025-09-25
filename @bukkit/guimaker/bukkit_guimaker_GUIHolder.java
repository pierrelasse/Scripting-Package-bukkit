import lol.pierrelasse.lua.LuaTable;
import org.bukkit.Bukkit;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.event.inventory.InventoryType;

public class bukkit_guimaker_GUIHolder implements InventoryHolder {
    private final Inventory inventory;
    public final LuaTable gui;

    public bukkit_guimaker_GUIHolder(LuaTable gui, String title, int size) {
        this.gui = gui;
        inventory = title == null
            ? Bukkit.createInventory(this, size)
            : Bukkit.createInventory(this, size, title);
    }

    public bukkit_guimaker_GUIHolder(LuaTable gui, String title, InventoryType type) {
        this.gui = gui;
        inventory = title == null
            ? Bukkit.createInventory(this, type)
            : Bukkit.createInventory(this, type, title);
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
