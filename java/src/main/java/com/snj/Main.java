//
//  Main.java
//  SNJShop
//
//  Created by akiyamaAB on 23/05/2026.
//
package com.snj;

import org.bukkit.plugin.java.JavaPlugin;

public class Main extends JavaPlugin {

    @Override
    public void onEnable() {
        getLogger().info("=================================");
        getLogger().info("  SNJShop");
        getLogger().info("  Завантаження плагіна...");
        getLogger().info("=================================");
        System.load("/Users/oleksijbrikin/SNJ/projects/SNJShop/.build/arm64-apple-macosx/debug/libSNJShop.dylib");
        getCommand("swift").setExecutor(new SwiftCommand());
    }

    @Override
    public void onDisable() {
        getLogger().info("=================================");
        getLogger().info("  SwiftPlugin вимикається...");
        getLogger().info("=================================");
    }
}
