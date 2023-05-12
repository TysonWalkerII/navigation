//
//  ViewModel.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var currentRoom: Room
    
    
    init() {
        self.currentRoom = .yourCell
    }
}
