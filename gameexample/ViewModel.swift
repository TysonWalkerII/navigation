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
    
    init() {
        self.currentRoom = .yourCell
        self.player = .player
        self.trash = .init(itemsInTrash: [])
    }
}
