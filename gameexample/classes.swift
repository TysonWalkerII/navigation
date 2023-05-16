//
//  classes.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import Foundation
let vmir = ViewModel()
struct Room: Identifiable {
    
    let id = UUID()
    
    public var forwardRoom: String?
    public var backwardRoom: String?
    public var leftRoom: String?
    public var rightRoom: String?
    var personInRoom: Person?
    var itemsInRoom: [Item]
    
    var connectedRooms: [Direction: String?] {
        [.forward: forwardRoom,
         .backward: backwardRoom,
         .left: leftRoom,
         .right: rightRoom]
    }
    
    
    
    var roompic:String
    init(forwardRoom: String? = nil, backwardRoom: String? = nil, leftRoom: String? = nil, rightRoom: String? = nil, roompic: String, personInRoom:Person? = nil, itemsInRoom:[Item]) {
        self.forwardRoom = forwardRoom
        self.backwardRoom = backwardRoom
        self.leftRoom = leftRoom
        self.rightRoom = rightRoom
        self.roompic = roompic
        self.personInRoom = personInRoom
        self.itemsInRoom = itemsInRoom
    }
    //TODO: add roomPics.  DONE
    static let yourCell = Room(forwardRoom: "exit", rightRoom: "yourSistersCell", roompic: "room", personInRoom: Person(portrait: "", dialog: [""], inventory: []), itemsInRoom: [])
    static let yourSistersCell = Room(forwardRoom: "exit", leftRoom: "yourCell", roompic: "room1",personInRoom: Person(portrait: "",dialog: [""], inventory: []), itemsInRoom: [])
    static let exit = Room(forwardRoom: "guardsRoom", backwardRoom: "yourCell", roompic: "room2",personInRoom: Person(portrait: "botaningame",dialog: ["Hello","Are you lost too?", "you recognize me?", "Thank you I've never ran into a fan before"], inventory: []), itemsInRoom: [Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column")])
    static let guardsRoom = Room(backwardRoom: "exit", roompic: "poolrooms", personInRoom: Person(portrait: "", dialog: [""], inventory: []), itemsInRoom: [ ])
    static let rooms: [String:Room] = ["yourCell":yourCell, "yourSistersCell": yourSistersCell, "exit":exit, "guardsRoom":guardsRoom]
    
    
//    func goForward() -> Room? {
//        guard let forwardRoom = self.forwardRoom else {
//            return nil
//        }
//        return Self.rooms[forwardRoom]
//    }
    
    //TODO: call this function when you tap a button to update the @published value in the view model
    func move(_ direction: Direction) -> Room? {
        switch direction {
            
        case .forward:
            
           // vmir.currentRoom =
           // print(rooms)
            
            guard let room = self.forwardRoom
            else {
                return nil
            }
            return Self.rooms[room]
        case .backward:
            guard let room = self.backwardRoom else {
                return nil
            }
            return Self.rooms[room]
        case .left:
            guard let room = self.leftRoom else {
                return nil
            }
            return Self.rooms[room]
        case .right:
            guard let room = self.rightRoom else {
                return nil
            }
            return Self.rooms[room]
        }
    }
}


//class Building{
//    var room1 = Room(connectedRooms: [], roompic: "")
//    var room2 = Room(connectedRooms: [],roompic: "")
//    var room3 = Room(connectedRooms: [], roompic: "")
//    var room4 = Room(connectedRooms: [], roompic: "")
//
//
//    init(room1:Room,room2:Room, room3:Room, room4:Room){
//        self.room1 = room1
//        self.room2 = room2
//        self.room3 = room3
//        self.room4 = room4
//
//    }
//
//
//
//
//
//}

class Building{
    var rooms: [Room] = []


    init(rooms:[Room]){
        self.rooms = rooms

    }





}


//var yourcell = Room(connectedRooms: [],roompic: "room", roomType: "right")
//var yoursisterscell = Room(connectedRooms: [yourcell], roompic: "room1", roomType: "up")
//var exit = Room(connectedRooms: [ ,yoursisterscell], roompic: "room2", roomType: "down")
//var someRoomWithGuardsInIt = Room(connectedRooms: [exit,yourcell,yoursisterscell], roompic: "backgroundthingy", roomType: "left")

//var prison = Building(room1:yourcell , room2: yoursisterscell,room3: exit, room4:someRoomWithGuardsInIt)
//var prison = Building(rooms: [yourcell,yoursisterscell,exit, someRoomWithGuardsInIt])

//class Singer{
//    var name:String
//    var age:Int
//    init(name:String, age:Int){
//        self.name = name
//        self.age = age
//    }
//}

//var randomSinger = Singer(name: "taylor swift", age: 3)


//Next part will be giving every room their boolean to show whether we passed the room or not. An arrow will be shown and the boolean will determine whether the arrow is normal or the opposite of what it would be if we passed the room

class Person: Identifiable{
    let id = UUID()
    public var hp: Int?
    public var portrait: String?
    public var dialog:[String]
    public var inventory:[Item]
    
    init(hp:Int? = nil, portrait:String?, dialog:[String],inventory:[Item]){
        self.hp = hp
        self.portrait = portrait
        self.dialog = dialog
        self.inventory = inventory
    }
    static let playersItems = [Item(itemImg: "column",itemName: "column")]
    static let player = Person(hp: 100, portrait: "botaningame", dialog: [], inventory: playersItems)
    
    
}

class Item :Identifiable{
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


//extension Item: Equatable{
//    static func == (lhs: Item, rhs: Item) -> Bool {
//        let someVariable = lhs.id == rhs.id && lhs.itemImg == rhs.itemImg &&
//        lhs.itemName == rhs.itemName &&
//        lhs.itemDescription == rhs.itemDescription
//        return someVariable
//    }
//}


