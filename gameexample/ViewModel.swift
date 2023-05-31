//
//  ViewModel.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var currentRoom: Room
    @Published var player:Person
    @Published var trash: Trash
    @Published var progress: Double = 0.0
    @Published var choices:[Choice] = []
    @Published var selectedItem = Item()

    
    private let randomNumbersInAnArray = [1.0,14.0,7.0]

    func useItem(item:String){
        player.inventory.remove(at:player.inventory.firstIndex(where:{$0.itemName == item}) ?? 0)
        print("here is the item  \(item)")
    }
    
    func addRisk(){
        print("\(progress)")
        progress += randomNumbersInAnArray[Int.random(in: 1..<randomNumbersInAnArray.count)]
        print("\(progress)")
    }
    //TODO: Call in view
    func changeLookOfRoom() {
        currentRoom.move()
            }
    
    
    init() {
        self.currentRoom = Room.rooms[0]
        self.player = .player
        self.trash = .init(itemsInTrash: [])
        
    }
}
