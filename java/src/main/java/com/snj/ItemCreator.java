package com.snj;

import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.entity.Player;
import org.bukkit.Bukkit;


public class ItemCreator {
    public static ItemStack createItem(String materialName, String displayName, int customModelData) {
        ItemStack item = new ItemStack(Material.valueOf(materialName.toUpperCase()));
        ItemMeta meta = item.getItemMeta();
        meta.setDisplayName(displayName);
        meta.setCustomModelData(customModelData);
        item.setItemMeta(meta);
        return item;
    }
    public static void giveItem(String playerName, String materialName, String displayName, int customModelData) {
        Player player = Bukkit.getPlayer(playerName);
        if (player == null) return;
        ItemStack item = createItem(materialName, displayName, customModelData);
        player.getInventory().addItem(item);
    }
    public static void sendMessage(String playerName, String message) {
        Player player = Bukkit.getPlayer(playerName);
        if (player == null) return;
        player.sendMessage(message);
    }
}
