//
//  ProgressBarView.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/30/23.
//

import SwiftUI

struct ProgressBarView: View {
 //   var randomNumbersInAnArray = [1.0,14.0,7.0]
    @State var progress: Double
//    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
//    func addRisk(){
//        progress += randomNumbersInAnArray[Int.random(in: 1..<randomNumbersInAnArray.count)]
//    }
    
//    func removeRisk(){
//        progress = 0
//    }

        

    var body: some View {
           
           // List{
                
                ProgressView(value: progress, total: 100){
                    Text("Risk Level")
                }currentValueLabel: {
                    Text("\(Int(progress))%")
                }.tint(.red)
                .progressViewStyle(.linear)
                .frame(width:200)
                .background(.white)
               
                
           // }.scaledToFit()
        
        
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(progress: 9)
    }
}


