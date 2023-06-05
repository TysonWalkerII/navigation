//
//  classes.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import Foundation
import SwiftUI

struct Room {
//    let id = UUID()
    var personInRoom: Person?
    var key:Item?
    var dialog:String?
    var choices:[Choice]?
    var roompic:String
    var itemsInRoom: [Item]
    //Create the move function that randomizes rooms
    mutating func move() {
        self = Room.rooms.randomElement()!
    }
        
    static let rooms: [Room] = [
        Room(roompic: "MainRoom", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "room", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "poolrooms", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "room1", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "room2", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "hallway", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "backgroundtestthingy", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "", itemsInRoom: [Item.items.randomElement()!]),
        Room(roompic: "", itemsInRoom: [Item.items.randomElement()!])
             ]
}
//struct randomRoom: View {
//    var body: some View {
//        VStack {
//            Button("RandomRoom") {
//                print(Room.rooms.randomElement())
//            }
//        }
//    }
//}
//struct randomRoom_Previewd: PreviewProvider {
//    static var previews: some View {
//        randomRoom()
//    }
//}


