//
//  test2.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/10/23.
//
//PURPOSE OF THIS FILE
//HOPEFULLY I CAN GET THE FUNCTIONALITY FOR THE NAVIGATION TO WORK WITH THE VARIABLES I MADE INSTEAD OF JUST IF STATEMENTS

import SwiftUI

struct test2: View {
    
    var currentRoom = prison.rooms[0]
    
   
    var body: some View {
        ZStack{
            Image("\(currentRoom.roompic)")
        }
    }
}

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}
