//
//  EconomyManager.java
//  SNJShop
//
//  Created by akiyamaAB on 24/05/2026.
//

package com.snj;

import net.milkbowl.vault.economy.Economy;
import org.bukkit.Bukkit;
import org.bukkit.plugin.Plugin;
import org.bukkit.plugin.RegisteredServiceProvider;

public class EconomyManager {
    private static Economy economy = null;

    public static boolean setup(Plugin plugin) {
        RegisteredServiceProvider<Economy> rsp = plugin.getServer()
            .getServicesManager()
            .getRegistration(Economy.class);
        if (rsp == null) return false;
        economy = rsp.getProvider();
        return economy != null;
    }

    public static double getBalance(String playerName) {
        if (economy == null) return 0;
        return economy.getBalance(Bukkit.getPlayer(playerName));
    }

    public static boolean withdraw(String playerName, double amount) {
        if (economy == null) return false;
        return economy.withdrawPlayer(Bukkit.getPlayer(playerName), amount).transactionSuccess();
    }
}
