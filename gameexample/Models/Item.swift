//
//  Item.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/30/23.
//

import Foundation

// TODO: Make struct
class Item :Identifiable, ObservableObject, Equatable{
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.itemName == rhs.itemName
        
    }
    
    
    
    let id = UUID()
    public var itemImg:String?
    public var itemName:String?
    public var itemDescription:String?
     
    init(itemImg: String? = nil, itemName: String? = nil, itemDescription: String? = nil) {
        self.itemImg = itemImg
        self.itemName = itemName
        self.itemDescription = itemDescription
    }
    
   
    
    
}
