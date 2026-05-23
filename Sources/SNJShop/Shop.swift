import PaperAPI
import SwiftJava

public struct Shop {
    public static func initialize() {
        
    }
    public static func openShop(playerName: String) {
        print("[SNJShop] openShop called for: \(playerName)")
        let bukkit: JavaClass<Bukkit>?
        do {
            bukkit = try JavaClass<Bukkit>()
            print("[SNJShop] bukkit ok")
        } catch {
            print("[SNJShop] bukkit error: \(error)")
            return
        }
        print("[SNJShop] bukkit: \(String(describing: bukkit))")
        let player = bukkit?.getPlayer(playerName)
        print("[SNJShop] player: \(String(describing: player))")
        let itemCreator = try? JavaClass<ItemCreator>()
        let item = itemCreator?.createItem("DIAMOND", "SWIFT SHARD", 1)
        
        do {
            let gui = try bukkit?.createInventory(nil, 36)
            try? gui?.setItem(13, item)
            _ = player?.openInventory(gui)
        } catch {
            print("[SNJShop] Error: \(error)")
        }
    }
    
    public static func handleCommand(playerName: String, args: [String]) -> Bool{
        if args.isEmpty {
            return true
        }
        if args[0] == "shop" {
            openShop(playerName: playerName)
            return true
        }
        return false
    }
    
}
