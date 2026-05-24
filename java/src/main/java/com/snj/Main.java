//
//  Main.java
//  SNJShop
//
//  Created by akiyamaAB on 23/05/2026.
//
package com.snj;

import org.bukkit.plugin.java.JavaPlugin;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Main extends JavaPlugin {

    @Override
    public void onEnable() {
        File swiftLibsDir = new File(getDataFolder().getParent(), "swiftlibs");
        
        try {
            System.load(new File(swiftLibsDir, "libSwiftRuntimeFunctions.dylib").getAbsolutePath());
            System.load(new File(swiftLibsDir, "libSwiftJava.dylib").getAbsolutePath());
            System.load(new File(swiftLibsDir, "libSNJShop.dylib").getAbsolutePath());
        } catch (Exception e) {
            getLogger().severe("Failed to load Swift libs: " + e.getMessage());
            return;
        }
        
        getLogger().info("=================================");
        getLogger().info("  SNJShop");
        getLogger().info("  Завантаження плагіна...");
        getLogger().info("=================================");
        
        getCommand("swift").setExecutor(new SwiftCommand());
        getServer().getPluginManager().registerEvents(new ShopListener(), this);
        EconomyManager.setup(this);
    }

    @Override
    public void onDisable() {
        getLogger().info("=================================");
        getLogger().info("  SwiftPlugin вимикається...");
        getLogger().info("=================================");
    }

}
