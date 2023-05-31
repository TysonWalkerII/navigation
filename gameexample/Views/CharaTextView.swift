//
//  CharaTextView.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/31/23.
//

import SwiftUI

struct CharaTextView: View {
    @ObservedObject var vm: ViewModel
    @State var charaText = "placeholder for now"
    @State var testForButtonInPreview = false
    var body: some View {
        Section{
            Section{
                ZStack{
                    Image("\(vm.currentRoom.personInRoom?.portrait ?? "")").resizable().scaledToFit()
                }
                
            }.frame(height:200)
            
           
            
          //  if charaText == ""{
                VStack(alignment: .leading){
                    Text(":::\(vm.currentRoom.personInRoom?.nameOfPerson ?? "Can't get the name"):::").font(.custom(
                        "ChakraPetch-Light",
                        
                        fixedSize: 16))
                    Text("\(charaText)").font(.custom(
                        "ChakraPetch-Light",
                        
                        fixedSize: 16))
                }.padding(20).background(.gray)
                
          //  }
            
        }.background(testForButtonInPreview ? .black : .blue).onTapGesture {
                print("thing has been tapped")
                testForButtonInPreview.toggle()
                vm.changeDialogue()}
    }
}

struct CharaTextView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var vm = ViewModel()
        CharaTextView(vm: vm)
    }
}
