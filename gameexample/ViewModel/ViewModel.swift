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
    @Published var fA = false
    @Published var bA = false
    @Published var lA = false
    @Published var rA = false
    
    init() {
        self.currentRoom = .yourCell
        self.player = .player
//        print(currentRoom)
        self.trash = .init(itemsInTrash: [])
    }
}
