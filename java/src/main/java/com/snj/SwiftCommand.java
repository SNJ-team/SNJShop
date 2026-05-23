//
//  SwiftCommand.java
//  SNJShop
//
//  Created by akiyamaAB on 23/05/2026.
//

package com.snj;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;

import org.bukkit.entity.Player;

public class SwiftCommand implements CommandExecutor {
    
    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!(sender instanceof Player)) return false;
        Player player = (Player) sender;
        
        if (args.length == 0) {
            player.sendMessage("Hello from Swift!");
            return true;
        }
        if (args[0].equals("shop")) {
            player.sendMessage("Opening shop...");
            Shop.openShop(player.getName());
            return true;
        }
        return false;
    }
}
