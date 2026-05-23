package com.snj;

import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;

public class ItemCreator {
    public static ItemStack createItem(String materialName, String displayName, int customModelData) {
        ItemStack item = new ItemStack(Material.valueOf(materialName.toUpperCase()));
        ItemMeta meta = item.getItemMeta();
        meta.setDisplayName(displayName);
        meta.setCustomModelData(customModelData);
        item.setItemMeta(meta);
        return item;
    }
}
