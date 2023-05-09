//
//  room2View.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/5/23.
//

import SwiftUI

struct room2View: View {
    @State private var positionOfRoom2Background = 300
    @State private var boolThingThatTotallyWorks = false
    var body: some View {
        ZStack{
           Image("poolrooms")
            if boolThingThatTotallyWorks{
                Image("itemrequiredyay")
            }
           
        }.onAppear(){
            withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                boolThingThatTotallyWorks.toggle()
            }
        }
     
    }
}

struct room2View_Previews: PreviewProvider {
    static var previews: some View {
        room2View()
    }
}
