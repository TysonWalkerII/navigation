//
//  Trash.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/30/23.
//

import Foundation

struct Trash: Identifiable {
    let id = UUID()
    var itemsInTrash: [Item]
}
