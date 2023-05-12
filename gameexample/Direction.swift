//
//  Direction.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import Foundation

enum Direction: String, Equatable, Comparable {
    static func < (lhs: Direction, rhs: Direction) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    case forward, backward, left, right
}
