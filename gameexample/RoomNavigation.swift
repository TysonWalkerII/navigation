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
                    Image("ddr arrow")
                        .resizable()
                        .frame(width:60,height:60)
                case .backward:
                    Image("ddr arrow")
                        .resizable()
                        .frame(width:60,height:60)
                        .rotationEffect(.degrees(180))
                case .left:
                    Image("ddr arrow")
                        .resizable()
                        .frame(width:60,height:60)
                        .rotationEffect(.degrees(-90))
                case .right:
                    Image("ddr arrow")
                        .resizable()
                        .frame(width:60,height:60)
                        .rotationEffect(.degrees(90))
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
