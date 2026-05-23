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
            let gui = try bukkit?.createInventory(nil, 36, "Swift Shop")
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
    public static func onShopClick(playerName: String, slot: Int32) {
        if slot != 13 { return }
        
        let economy: JavaClass<EconomyManager>?
        do {
            economy = try JavaClass<EconomyManager>()
        } catch {
            print("[SNJShop] economy error: \(error)")
            return
        }
        
        let itemCreator: JavaClass<ItemCreator>?
        do {
            itemCreator = try JavaClass<ItemCreator>()
        } catch { return }
        
        let balance = economy?.getBalance(playerName) ?? 0
        let price = 100.0
        
        if balance < price {
            itemCreator?.sendMessage(playerName, Messages.buyUnsuccess(itemName: "Swift Shard"))
            return
        }
        
        _ = economy?.withdraw(playerName, price)
        
        
        
        itemCreator?.giveItem(playerName, "DIAMOND", "Swift Shard", 1)
        itemCreator?.sendMessage(playerName,  Messages.buySuccess(itemName: "Swift Shard", price: 100))
    }
}

