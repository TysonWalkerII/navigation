//
//  classes.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import Foundation

class Room{
    var connectedRooms:[Room]
    var roompic:String
    init(connectedRooms:[Room], roompic:String){
        self.connectedRooms = connectedRooms
        self.roompic = roompic
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


var yourcell = Room(connectedRooms: [],roompic: "room")
var yoursisterscell = Room(connectedRooms: [yourcell], roompic: "room1")
var exit = Room(connectedRooms: [yourcell,yoursisterscell], roompic: "room2")
var someRoomWithGuardsInIt = Room(connectedRooms: [exit,yourcell,yoursisterscell], roompic: "backgroundthingy")

//var prison = Building(room1:yourcell , room2: yoursisterscell,room3: exit, room4:someRoomWithGuardsInIt)
var prison = Building(rooms: [yourcell,yoursisterscell,exit, someRoomWithGuardsInIt])

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
