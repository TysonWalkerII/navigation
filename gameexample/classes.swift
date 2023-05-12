//
//  classes.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import Foundation

struct Room: Identifiable {
    
    let id = UUID()
    
    public var forwardRoom: String?
    public var backwardRoom: String?
    public var leftRoom: String?
    public var rightRoom: String?
    
    var connectedRooms: [Direction: String?] {
        [.forward: forwardRoom,
         .backward: backwardRoom,
         .left: leftRoom,
         .right: rightRoom]
    }
    
    
    
    var roompic:String
    init(forwardRoom: String? = nil, backwardRoom: String? = nil, leftRoom: String? = nil, rightRoom: String? = nil, roompic: String) {
        self.forwardRoom = forwardRoom
        self.backwardRoom = backwardRoom
        self.leftRoom = leftRoom
        self.rightRoom = rightRoom
        self.roompic = roompic
    }
    //TODO: add roomPics.
    static let yourCell = Room(forwardRoom: "exit", rightRoom: "yourSistersCell", roompic: "")
    static let yourSistersCell = Room(forwardRoom: "exit", leftRoom: "yourCell", roompic: "")
    static let exit = Room(forwardRoom: "guardsRoom", backwardRoom: "yourCell", roompic: "")
    static let guardsRoom = Room(backwardRoom: "exit", roompic: "")
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
            guard let room = self.forwardRoom else {
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

class Singer{
    var name:String
    var age:Int
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
}

var randomSinger = Singer(name: "taylor swift", age: 3)


//Next part will be giving every room their boolean to show whether we passed the room or not. An arrow will be shown and the boolean will determine whether the arrow is normal or the opposite of what it would be if we passed the room
