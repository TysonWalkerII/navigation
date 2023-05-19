//
//  forward.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/5/23.
//

import SwiftUI

struct forward: View {
    @State private var fadeInOut = false
    @State private var positionOfBackground = 0
    @State private var positionOfRoom2Background:CGFloat = -300
    @State private var room2 = false
    @State var boolThing = false
    @State var dialog = false
    @State private var heightOTT: CGFloat = 0.0
    @State private var widthOfTheThing: CGFloat = 1.0
    
    
    
    
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    
    var body: some View {
        ZStack{
            Image("background")
                .scaleEffect(scale)
              
                
           

            if boolThing == true{
                Rectangle()
                }
            
            if room2{
                Image("room2")
                    .scaleEffect(scale2)
              
                
            }
            VStack{
                Spacer().frame(height:700)
                
                Image("ddr arrow").resizable().frame(width:50,height:50).onTapGesture{
                    withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                        scale += 1
                    }
                    
                    withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                        boolThing.toggle()
                    }
                    
                    withAnimation(.easeIn(duration: 1.0).delay(1)){
                        room2.toggle()
                       // scale2 += 1


                    }
                    withAnimation(.easeIn(duration: 1.2).delay(0.5)){
                        //room2.toggle()
                        scale2 += 0.5


                    }
                    
                }
        }
            
            }
        
           
        
    }
}

struct forward_Previews: PreviewProvider {
    static var previews: some View {
        forward()
    }
}
