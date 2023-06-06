//
//  Item.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/30/23.
//

import Foundation

// TODO: Make struct
struct Item: Identifiable {
    
    let id = UUID()
    public var itemImg:String?
    public var itemName:String?
    public var itemDescription:String?

    
    
//    init(itemImg: String? = nil, itemName: String? = nil, itemDescription: String? = nil) {
//        self.itemImg = itemImg
//        self.itemName = itemName
//        self.itemDescription = itemDescription
//    }
    

    
   
    
    static let items: [Item] = [Item(itemImg: "Bread", itemName: "Bread", itemDescription: "It's just Bread..."), Item(itemImg: "coffeecup", itemName: "Koffee", itemDescription: "Get energized with our new invention... A Cup O' Joe")]
//    Item(itemImg: "", itemName: "here", itemDescription: ""), Item(itemImg: "", itemName: "we", itemDescription: ""), Item(itemImg: "", itemName: "go", itemDescription: ""), Item(itemImg: "", itemName: "son", itemDescription: ""), Item(itemImg: "", itemName: "yep", itemDescription: "")]
}

