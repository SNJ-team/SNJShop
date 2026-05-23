//
//  Messages.swift
//  SNJShop
//
//  Created by akiyamaAB on 23/05/2026.
//


struct Messages {
    static func buySuccess(itemName: String, price: Int) -> String {
        return "You have purchased \(itemName) for \(price) coins"
    }
    static func buyUnsuccess(itemName: String) -> String {
        return "You don't have enought money to buy \(itemName)"
    }
}
