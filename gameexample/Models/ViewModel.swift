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
           
            guard let nameOfRoom = currentRoom.forwardRoom else{
                return
            }
            
            currentRoom.explored?.toggle()
            currentRoom.move(.forward)
            print( Room.rooms["\(nameOfRoom)"])
            print(nameOfRoom)
            currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: false, dialog: "", choices: [])
            //ROOM PICTURE
            //CHARA PIC
            //CHARA DIALOG
            currentRoom.explored?.toggle()
        guard let portrait = currentRoom.personInRoom?.portrait else { return }
        if !portrait.isEmpty {
                //MAYBE THE ROOMS NUMBER CAN GO UP EVERY TIME YOU ENTER IT, AND THE CHARACTER CAN USE THE DIALOG DEPENDING ON HOW MANY TIMER YOU HAVE ENTERED THE ROOM, MAYBE THERE CAN BE MANY DIFFERENT PIECES OF DIALOG THAT RANDOMLY SHOW UP INSTEAD
                
                //ROOM DIALOG
                
//                roomDialog = currentRoom.dialog ?? ""
                choices = currentRoom.choices
                
              //  print("\(charaDialog)")
              //  print("\(vm.currentRoom.itemsInRoom)")
              //  print(vm.currentRoom.explored)
                addRisk()
                print("forward arrow")
            }else{
                
//                charaImage = ""
//                charaDialogCount  = 1
//                charaDialog = [""]
//                charaText = ""
            }
        
    }
    
    
    init() {
        self.currentRoom = .dangerZone
        self.player = .player
        self.trash = .init(itemsInTrash: [])
        self.choices = currentRoom.choices
    }
}
