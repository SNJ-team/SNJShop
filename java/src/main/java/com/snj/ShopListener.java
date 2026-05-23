//
//  ShopListener.java
//  SNJShop
//
//  Created by akiyamaAB on 24/05/2026.
//

package com.snj;

import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.entity.Player;

public class ShopListener implements Listener {
    
    @EventHandler
    public void onInventoryClick(InventoryClickEvent event) {
        if (!(event.getWhoClicked() instanceof Player)) return;
        
        String title = event.getView().getOriginalTitle();
        if (!title.equals("Swift Shop")) return;
        
        event.setCancelled(true);
        
        Player player = (Player) event.getWhoClicked();
        int slot = event.getSlot();
        
        Shop.onShopClick(player.getName(), slot);
    }
}
