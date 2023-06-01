//
//  TextboxView.swift
//  gameexample
//
//  Created by Ciondra Brown on 6/1/23.
//

import SwiftUI

struct TextboxView: View {
    var body: some View {
       let path = Path { path in
            let width: CGFloat = 275
            let height: CGFloat = 428
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
        //.stroke(Color.pink, lineWidth: 20)
        path.fill(Color.red).overlay(path.stroke(Color.black, lineWidth: 2))
    }
}

struct TextboxView_Previews: PreviewProvider {
    static var previews: some View {
        TextboxView()
        
    }
}
