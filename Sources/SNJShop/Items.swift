//
//  Items.swift
//  SNJShop
//
//  Created by akiyamaAB on 23/05/2026.
//

struct Item {
    var material: String
    var name: String
    var description: String
    var cmd: Int
    var price: Int
}

extension Item {
    static let swiftShard = Item(
        material: "DIAMOND",
        name: "Swift Shard",
        description: "A shard forged in Swift",
        cmd: 1,
        price: 100
    )
}
