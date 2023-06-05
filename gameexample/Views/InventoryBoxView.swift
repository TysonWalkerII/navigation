//
//  InventoryBoxView.swift
//  gameexample
//
//  Created by Ciondra Brown on 6/5/23.
//

import SwiftUI

struct InventoryBoxView: View {
    var body: some View {
            let path = Path { path in
                let width: CGFloat = 342
                let height: CGFloat = 665
                //top top left
                path.move(
                    to: CGPoint(
                        x: 0.13 * width,
                        y: 0 * height
                    )
                )
                //top top right
                path.addLine(
                    to: CGPoint(
                        x: 0.86 * width,
                        y: 0 * height)
                )
                //top bottom right
                path.addLine(
                    to: CGPoint(
                        x: 0.9 * width,
                        y: 0.02 * height)
                )
                // botttom top right
                path.addLine(
                    to: CGPoint(
                        x: 0.9 * width,
                        y: 0.98 * height)
                )
                
                //bottom bottom right
                path.addLine(
                    to: CGPoint(
                        x: 0.85 * width,
                        y: 1 * height)
                )
                
                //bottom bottom left
                path.addLine(
                    to: CGPoint(
                        x: 0.15 * width,
                        y: 1 * height)
                )
                //bottom top left
                path.addLine(
                    to: CGPoint(
                        x: 0.1 * width,
                        y: 0.98 * height)
                )
                //top bottom left
                path.addLine(
                    to: CGPoint(
                        x: 0.09 * width,
                        y: 0.02 * height)
                )
                
                path.closeSubpath()
            }
            path.fill(Color("InsideTextBoxColor"))
                .overlay(path.stroke(Color("BorderTextBox"), lineWidth: 2))
                .shadow(color:Color("ShadowTextBox"), radius: 4)
    }
}

struct InventoryBoxView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryBoxView()
    }
}
