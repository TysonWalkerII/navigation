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
    @Published var showInventory: Bool = false
    @Published var roomCounter = 0

    @Published var showInventory: Bool = true
    @Published var randomStatusArray = [StealthStatus.zero, StealthStatus.one, StealthStatus.eight]
    @Published var barurl = "Stealth_0"
    enum StealthStatus{
        case zero, one, two, three, four, five, six, seven, eight, nine, ten
        
    }
    func riskMeterDisplay(status: StealthStatus ) -> String{
        if status == .zero{
            return "Stealth_0"
        } else if status == .one {
            return "Stealth_1"
        } else if status == .two {
            return "Stealth_2"
        } else if status == .three {
            return "Stealth_3"
        } else if status == .four {
            return "Stealth_4"
        } else if status == .five {
            return "Stealth_5"
        } else if status == .six {
            return "Stealth_6"
        } else if status == .seven {
            return "Stealth_7"
        } else if status == .eight {
            return "Stealth_8"
        } else if status == .nine {
            return "Stealth_9"
        } else{
            return "Stealth_10"
        }
    }
    var choices:[Choice] {
        if let choices = currentRoom.choices {
            return choices
        } else {
            return []
        }
    }
    @Published var selectedItem = Item()
    //    @Published var roomDialog:String
    //chara dialog stuff
    @Published var charaDialogCount  = 0
    @Published var charaDialog = [""]
    @Published var charaText = ""
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
    func theStairs() {
        currentRoom.stairs()
    }
    
    func changeLookOfRoom() {
        if roomCounter == 5 {
            self.theStairs()
            roomCounter = 0
            return
        }
        var nextRoom = currentRoom
        while currentRoom == nextRoom {
            currentRoom.move()
        }
        roomCounter += 1
    }
    
    
    init() {
        self.currentRoom = Room.rooms[0]
        self.player = .player
        self.trash = .init(itemsInTrash: [])
    }
}
