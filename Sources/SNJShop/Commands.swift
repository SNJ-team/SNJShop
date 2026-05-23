//
//  Commands.swift
//  SNJShop
//
//  Created by akiyamaAB on 23/05/2026.
//
import PaperAPI

public func handleCommand(playerName: String, args: [String]) -> Bool{
    if args.isEmpty {
        return true
    }
    if args[0] == "shop" {
        Shop.openShop(playerName: playerName)
        return true
    }
    return false 
}
