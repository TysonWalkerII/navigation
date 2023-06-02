//
//  ViewModel.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var currentRoom: Room
    @Published var player:Person
    @Published var trash: Trash
    @Published var progress: Double = 0.0
    @Published var choices:[Choice] = []
    @Published var selectedItem = Item()
//    @Published var roomDialog:String
    //chara dialog stuff
    @Published var charaDialogCount  = 0
    @Published var charaDialog = [""]
    @Published var charaText = ""
    @Published var thisThing = []
    //chara dialog stuff

    
    private let randomNumbersInAnArray = [1.0,14.0,7.0]

    func useItem(item:String){
//        player.inventory.remove(at:player.inventory.firstIndex(where:{$0.itemName == item}) ?? 0)
//        print("here is the item  \(item)")
//        print("\(player.inventory[0].itemName)")
        
       // ForEach(player.inventory, id: \.id){ thing in
           // if thing.itemName == item{
        
        player.inventory.remove(at: player.inventory.firstIndex(of: Item(itemImg: "\(item)", itemName: "\(item)", itemDescription: "\(item)")) ?? 0)
        print("\(item)")
            //}
       // }
        
    }
    
    func addRisk(){
        print("\(progress)")
        progress += randomNumbersInAnArray[Int.random(in: 1..<randomNumbersInAnArray.count)]
        print("\(progress)")
    }
    
    func changeLookOfRoom() {
        currentRoom.move()
    }
    
    init() {
        self.currentRoom = Room.rooms[0]
        self.player = .player
        self.trash = .init(itemsInTrash: [])
        
    }
    
    
    init() {
        self.currentRoom = .dangerZone
        self.player = .player
        self.trash = .init(itemsInTrash: [])
        self.choices = currentRoom.choices
    }
}
