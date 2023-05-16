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
    
    init() {
        self.currentRoom = .yourCell
        self.player = .player
//        print(currentRoom)
    }
}
