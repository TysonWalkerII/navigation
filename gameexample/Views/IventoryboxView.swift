//
//  IventoryboxView.swift
//  gameexample
//
//  Created by Ciondra Brown on 6/2/23.
//

import SwiftUI

struct IventoryboxView: View {
        var body: some View {
                let path = Path { path in
                    let width: CGFloat = 342
                    let height: CGFloat = 665
                    //top top left
                    path.move(
                        to: CGPoint(
                            x: 0.18 * width,
                            y: 0 * height
                        )
                    )
                    //top top right
                    path.addLine(
                        to: CGPoint(
                            x: 0.8 * width,
                            y: 0 * height)
                    )
                    //top bottom right
                    path.addLine(
                        to: CGPoint(
                            x: 0.9 * width,
                            y: 0.05 * height)
                    )
                    // botttom top right
                    path.addLine(
                        to: CGPoint(
                            x: 0.9 * width,
                            y: 0.95 * height)
                    )
                    
                    //bottom bottom right
                    path.addLine(
                        to: CGPoint(
                            x: 0.8 * width,
                            y: 1 * height)
                    )
                    
                    //bottom bottom left
                    path.addLine(
                        to: CGPoint(
                            x: 0.2 * width,
                            y: 1 * height)
                    )
                    path.addLine(
                        to: CGPoint(
                            x: 0.1 * width,
                            y: 0.95 * height)
                    )
                    //top bottom left
                    path.addLine(
                        to: CGPoint(
                            x: 0.09 * width,
                            y: 0.05 * height)
                    )
                    
                    path.closeSubpath()
                }
                path.fill(Color("InsideTextBoxColor"))
                    .overlay(path.stroke(Color("BorderTextBox"), lineWidth: 2))
                    .shadow(color:Color("ShadowTextBox"), radius: 4)
        }
    }

struct IventoryboxView_Previews: PreviewProvider {
    static var previews: some View {
        IventoryboxView()
    }
}
