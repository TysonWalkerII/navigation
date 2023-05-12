//
//  RoomNavigation.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import SwiftUI

struct RoomNavigation: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        GeometryReader { geo in
            HStack {
                ForEach(vm.currentRoom.connectedRooms.keys.sorted(), id: \.self) { direction in
                    ddrArrows(for: direction)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .ignoresSafeArea()
        }
    }
    
    func ddrArrows(for direction: Direction) -> some View {
        ZStack {
            let optionalRoomName = vm.currentRoom.connectedRooms[direction]!
            if let roomName = optionalRoomName {
                switch direction {
                case .forward:
                    // TODO: make these buttons. the buttons actions should change what room we're in
                    Button{
                        guard let nameOfRoom = vm.currentRoom.forwardRoom else{
                            return
                        }
                        vm.currentRoom.move(.forward)
                       print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "")
                        
                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                    }
                    
                case .backward:
                    Button{
                        guard let nameOfRoom = vm.currentRoom.backwardRoom else{
                            return
                        }
                        
                        vm.currentRoom.move(.backward)
                        
                       print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "")
                        
                        
                       
                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(180))
                    }
                case .left:
                    Button{
                        guard let nameOfRoom = vm.currentRoom.leftRoom else{
                            return
                        }
                        vm.currentRoom.move(.left)
                       print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "")
                        
                        
                        
                        
                        
                        
                        
                        
                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(-90))
                    }
                case .right:
                    Button{
                        guard let nameOfRoom = vm.currentRoom.rightRoom else{
                            return
                        }
                        vm.currentRoom.move(.right)
                       print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "")
                        print("button was just tapped")
                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(90))
                    }
                }
            }
            else {
                EmptyView()
            }
        }
    }
}

struct RoomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RoomNavigation()
    }
}
