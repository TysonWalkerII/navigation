//
//  DoorButtonsNavigation.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/31/23.
//

import SwiftUI

struct DoorButtonsNavigation: View {
    @ObservedObject var vm:ViewModel
    var body: some View {
        GeometryReader { geo in

            ZStack{
                Section{
                Image("hallway").scaledToFill().padding(50)
            }
            

            Path { path in
                path.move(to: CGPoint(x: 0.069 * geo.size.width, y: 0.444 * geo.size.height))
                path.addLine(to: CGPoint(x: 0.182 * geo.size.width, y: 0.485 * geo.size.height))
                path.addLine(to: CGPoint(x: 0.189 * geo.size.width, y: 0.794 * geo.size.height))
                path.addLine(to: CGPoint(x: 0.070 * geo.size.width, y: 0.873 * geo.size.height))
            }  .fill(Color.red).onTapGesture{
                print("tapped the door")
                vm.changeLookOfRoom()
                vm.addRisk()
                print("current room has been changed to \(vm.currentRoom)")

            }

            Path { path in
                path.move(to: CGPoint(x: 0.251 * geo.size.width, y: 0.507 * geo.size.height))
                path.addLine(to: CGPoint(x: 0.335 * geo.size.width, y: 0.528 * geo.size.height))
                path.addLine(to: CGPoint(x: 0.337 * geo.size.width, y: 0.696 * geo.size.height))
                path.addLine(to: CGPoint(x: 0.256 * geo.size.width, y: 0.742 * geo.size.height))
            }  .fill(Color.red).onTapGesture{
                print("tapped on another door")
                vm.changeLookOfRoom()
                vm.addRisk()
            }

        }
        }.frame(width:393, height:759)
            .background(.black)
            
    }
}

struct DoorButtonsNavigation_Previews: PreviewProvider {
    static var previews: some View {
        DoorButtonsNavigation(vm:ViewModel())
    }
}
