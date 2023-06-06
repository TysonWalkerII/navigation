//
//  ProgressBarView.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/30/23.
//

import SwiftUI

struct StealthBarView: View {
 //   var randomNumbersInAnArray = [1.0,14.0,7.0]
    @StateObject var vm = ViewModel()
    @State private var progress: Double = 0.0
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    func addToTheThing(){
        progress += 1.0
    }
    var body: some View {
           
           // List{
                
        
            

        
           
        Image("\(vm.barurl)").onTapGesture{
            print("this is working kinda")
            vm.barurl = vm.riskMeterDisplay(status: vm.randomStatusArray.randomElement() ?? .ten)
                       }
            
               
//                ProgressView(value: progress, total: 100){
//                    Text("Risk Meter")
//                } currentValueLabel: {
//                    Text("\(Int(progress))%")
//                }.frame(width:200).background(.blue).tint(.purple)
//                .progressViewStyle(.linear)
//                .onTapGesture{
//                addToTheThing()
//            }
//        
      
               
                
           // }.scaledToFit()
        
        
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        StealthBarView()
    }
}



