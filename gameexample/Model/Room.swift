//
//  classes.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import Foundation

struct Room: Identifiable {
    
    let id: UUID
    let name: String
    public var locked:Bool
    public var forwardRoom: String?
    public var backwardRoom: String?
    public var leftRoom: String?
    public var rightRoom: String?
    var personInRoom: Person?
    var itemsInRoom: [Item]
    var key:Item?
    var explored:Bool?
    
    var connectedRooms: [Direction: String] {
        var rooms: [Direction: String] = [:]
        for pair in [Direction.forward: forwardRoom,Direction.backward: backwardRoom,Direction.left: leftRoom,Direction.right: rightRoom] {
            if let value = pair.value {
                rooms.updateValue(value, forKey: pair.key)
            }
        }
        return rooms
    }
    
    
    
    var roompic:String
    init(name: String, forwardRoom: String? = nil, backwardRoom: String? = nil, leftRoom: String? = nil, rightRoom: String? = nil, roompic: String, personInRoom:Person? = nil, itemsInRoom:[Item],locked:Bool,key:Item?,explored:Bool?) {
        self.name = name
        self.id = UUID()
        self.forwardRoom = forwardRoom
        self.backwardRoom = backwardRoom
        self.leftRoom = leftRoom
        self.rightRoom = rightRoom
        self.roompic = roompic
        self.personInRoom = personInRoom
        self.itemsInRoom = itemsInRoom
        self.locked = locked
        self.key = key
        self.explored = explored
    }
    
    static func createRooms() -> [Room] {
        return [
            Room(name: "yourCell", forwardRoom: "exit", rightRoom: "yourSistersCell", roompic: "room", personInRoom: Person(portrait: "", dialog: [""], inventory: [], dialog2: []), itemsInRoom: [], locked: false, key: nil, explored: false),
            Room(name: "yourSistersCell", forwardRoom: "exit", leftRoom: "yourCell", roompic: "room1",personInRoom: Person(portrait: "",dialog: [""], inventory: [], dialog2: []), itemsInRoom: [], locked: false, key: nil, explored: false),
            Room(name: "exit", forwardRoom: "guardsRoom", backwardRoom: "yourCell", roompic: "room2",personInRoom: Person(portrait: "botaningame",dialog: ["Hello","Are you lost too?", "good luck getting out", "I gave up a while ago ngl", "now I just jump on the bed all day", "beware...", "I heard theres some mysterious dude in the next room", "people never really return from there"], inventory: [], dialog2: ["????????","omg its u again","whoa omg wats it like in there"]), itemsInRoom: [Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column")], locked: false, key: nil, explored: false),
            Room(name: "guardsRoom", forwardRoom:"dangerZone",backwardRoom: "exit", roompic: "poolrooms", personInRoom: Person(portrait: "", dialog: [""], inventory: [], dialog2: []), itemsInRoom: [ ], locked: false, key: nil, explored: false),
            Room(name: "dangerZone", backwardRoom: "guardsRoom", roompic: "dangerzone", itemsInRoom: [], locked: true, key: Item(itemImg: "column", itemName: "column"), explored: false)
        ]
    }
    
    func move(_ direction: Direction, within rooms: [Room]) -> Room? {
        switch direction {
        case .forward:
            guard let room = self.forwardRoom else {
                return nil
            }
            return rooms.first {
                $0.name == room
            }
        case .backward:
            guard let room = self.backwardRoom else {
                return nil
            }
            return rooms.first {
                $0.name == room
            }
        case .left:
            guard let room = self.leftRoom else {
                return nil
            }
            return rooms.first {
                $0.name == room
            }
        case .right:
            guard let room = self.rightRoom else {
                return nil
            }
            return rooms.first {
                $0.name == room
            }
        }
    }
}



