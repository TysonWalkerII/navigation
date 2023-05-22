//
//  ViewModel.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    let rooms: [Room]
    @Published var currentRoom: Room { didSet { print(currentRoom.connectedRooms)}}
    @Published var player: Person
    @Published var trash: Trash
    @Published var fA = false
    @Published var bA = false
    @Published var lA = false
    @Published var rA = false
    
    func move(_ direction: Direction) {
        guard let room = currentRoom.move(direction, within: rooms) else {
            return
        }
        currentRoom = room
    }
    
    func randomRoom() {
        
    }
    
    init() {
        rooms = Room.createRooms()
        self.currentRoom = rooms.first(where: { $0.name == "yourCell"})!
        self.player = Person.player
//        print(currentRoom)
        self.trash = Trash(items: [])
//        print(self.currentRoom)

    }
}
