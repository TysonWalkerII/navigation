//
//  PlayerStats.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 6/6/23.
//

import SwiftUI

struct PlayerStats: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        ZStack(alignment:  Alignment(horizontal: .center, vertical: .center)){
            Image("\(vm.currentRoom.roompic)")
            Section{
                let path = Path { path in
                    let width: CGFloat = 342
                    let height: CGFloat = 765
                    //top right
                    path.move(
                        to: CGPoint(
                            x: 0.2 * width,
                            y: 0.41 * height
                        )
                    )
                   
                    // botttom  right
                    path.addLine(
                        to: CGPoint(
                            x: 0.2 * width,
                            y: 0.75 * height)
                    )

                    //bottom left
                    path.addLine(
                        to: CGPoint(
                            x: 0.04 * width,
                            y: 0.835 * height)
                    )
                    //top  left
                    path.addLine(
                        to: CGPoint(
                            x: 0.04 * width,
                            y: 0.36 * height)
                    )

                    path.closeSubpath()
                }
                path.fill(Color("InsideTextBoxColor"))
                    .overlay(path.stroke(Color("BorderTextBox"), lineWidth: 2))
                    .shadow(color:Color("ShadowTextBox"), radius: 4)
            }
        }
      
    }
}

struct PlayerStats_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStats()
    }
}
