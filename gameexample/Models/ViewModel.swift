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

    func useItem(item:Item){
        player.inventory.removeAll { inventoryItem in
            inventoryItem.id == item.id
        }
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
        self.currentRoom = .dangerZone
        self.player = .player
        self.trash = .init(itemsInTrash: [])
        self.choices = currentRoom.choices
    }
}
