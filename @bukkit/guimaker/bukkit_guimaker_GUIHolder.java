import lol.pierrelasse.lua.*;

import org.bukkit.Bukkit;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryHolder;
import org.bukkit.event.inventory.InventoryType;

public class bukkit_guimaker_GUIHolder implements InventoryHolder {
    public final LuaValue gui;
    private Inventory inventory;

    public bukkit_guimaker_GUIHolder(LuaValue gui) {
        this.gui = gui;
    }

    public bukkit_guimaker_GUIHolder(LuaTable gui, String title, int size) {
        this(gui);
        inventory = title == null
            ? Bukkit.createInventory(this, size)
            : Bukkit.createInventory(this, size, title);
    }

    public bukkit_guimaker_GUIHolder(LuaTable gui, String title, InventoryType type) {
        this(gui);
        inventory = title == null
            ? Bukkit.createInventory(this, type)
            : Bukkit.createInventory(this, type, title);
    }

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    @Override
    public Inventory getInventory() {
        return inventory;
    }
}
