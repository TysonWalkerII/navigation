//
//  Doors.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 6/6/23.
//

import SwiftUI

struct Doors: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        ZStack(alignment:  Alignment(horizontal: .center, vertical: .center)){
           // Image("\(vm.currentRoom.roompic)")
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
                   
                
                let path2 = Path { path in
                    let width: CGFloat = 342
                    let height: CGFloat = 765
                    //top right
                    path.move(
                        to: CGPoint(
                            x: 0.39 * width,
                            y: 0.45 * height
                        )
                    )
                   
                    // botttom  right
                    path.addLine(
                        to: CGPoint(
                            x: 0.39 * width,
                            y: 0.64 * height)
                    )
    
                    //bottom left
                    path.addLine(
                        to: CGPoint(
                            x: 0.28 * width,
                            y: 0.7 * height)
                    )
                    //top  left
                    path.addLine(
                        to: CGPoint(
                            x: 0.28 * width,
                            y: 0.42 * height)
                    )
    
                    path.closeSubpath()
                }
                path2.fill(Color(.red))
                    .overlay(path2.stroke(Color("BorderTextBox"), lineWidth: 2))
                    .shadow(color:Color("ShadowTextBox"), radius: 4)
                   
                
//                let path3 = Path { path in
//                    let width: CGFloat = 342
//                    let height: CGFloat = 765
//                    //top right
//                    path.move(
//                        to: CGPoint(
//                            x: 0.65 * width,
//                            y: 0.46 * height
//                        )
//                    )
//                   
//                    // botttom  right
//                    path.addLine(
//                        to: CGPoint(
//                            x: 0.65 * width,
//                            y: 0.59 * height)
//                    )
//    
//                    //bottom left
//                    path.addLine(
//                        to: CGPoint(
//                            x: 0.52 * width,
//                            y: 0.59 * height)
//                    )
//                    //top  left
//                    path.addLine(
//                        to: CGPoint(
//                            x: 0.525 * width,
//                            y: 0.46 * height)
//                    )
//    
//                    path.closeSubpath()
//                }
//                path3.fill(.pink)
//                    .overlay(path3.stroke(Color("BorderTextBox"), lineWidth: 2))
//                    .shadow(color:Color("ShadowTextBox"), radius: 4)
                
                let path4 = Path { path in
                    let width: CGFloat = 342
                    let height: CGFloat = 765
                    //top right
                    path.move(
                        to: CGPoint(
                            x: 0.65 * width,
                            y: 0.46 * height
                        )
                    )
                   
                    // botttom  right
                    path.addLine(
                        to: CGPoint(
                            x: 0.65 * width,
                            y: 0.59 * height)
                    )
    
                    //bottom left
                    path.addLine(
                        to: CGPoint(
                            x: 0.52 * width,
                            y: 0.59 * height)
                    )
                    //top  left
                    path.addLine(
                        to: CGPoint(
                            x: 0.525 * width,
                            y: 0.46 * height)
                    )
    
                    path.closeSubpath()
                }
                path4.fill(.purple)
                    .overlay(path4.stroke(Color("BorderTextBox"), lineWidth: 2))
                    .shadow(color:Color("ShadowTextBox"), radius: 4)
                   
                
                let path5 = Path { path in
                    let width: CGFloat = 342
                    let height: CGFloat = 765
                    //top right
                    path.move(
                        to: CGPoint(
                            x: 1.13 * width,
                            y: 0.42 * height
                        )
                    )
                   
                    // botttom  right
                    path.addLine(
                        to: CGPoint(
                            x: 1.13 * width,
                            y: 0.839 * height)
                    )
    
                    //bottom left
                    path.addLine(
                        to: CGPoint(
                            x: 0.93 * width,
                            y: 0.72 * height)
                    )
                    //top  left
                    path.addLine(
                        to: CGPoint(
                            x: 0.93 * width,
                            y: 0.45 * height)
                    )
    
                    path.closeSubpath()
                }
                path5.fill(.black)
                    .overlay(path5.stroke(Color("BorderTextBox"), lineWidth: 2))
                    .shadow(color:Color("ShadowTextBox"), radius: 4)
                
                
                
            }.frame(width:400, height:750)
        }
        
    }
}

struct Doors_Previews: PreviewProvider {
    static var previews: some View {
        Doors()
    }
}
