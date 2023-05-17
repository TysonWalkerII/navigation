//
//  Person.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/17/23.
//

import Foundation

class Person: Identifiable{
    let id = UUID()
    public var hp: Int?
    public var portrait: String?
    public var dialog:[String]
    public var dialog2:[String]?
    public var inventory:[Item]
    
    init(hp:Int? = nil, portrait:String?, dialog:[String],inventory:[Item], dialog2:[String]){
        self.hp = hp
        self.portrait = portrait
        self.dialog = dialog
        self.inventory = inventory
        self.dialog2 = dialog2
    }
    static let playersItems = [Item(itemImg: "column",itemName: "column")]
    static let player = Person(hp: 100, portrait: "botaningame", dialog: [], inventory: playersItems, dialog2: [])
    
    
}
