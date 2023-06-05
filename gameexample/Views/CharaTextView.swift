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
                    VStack(alignment: .leading){
                        Text(":::\(vm.currentRoom.personInRoom?.nameOfPerson ?? "Can't get the name"):::").font(.custom(
                            "ChakraPetch-Light",
                            
                            fixedSize: 16))
                        Text("\(vm.currentRoom.personInRoom?.dialog[vm.charaDialogCount] ?? "placeholder hehe")").font(.custom(
                            "ChakraPetch-Light",
                            
                            fixedSize: 16))
                    }.padding(20).background(.gray)
                }
                
            }.frame(height:200)
            
           
            
          //  if charaText == ""{
                
                
          //  }
            
        }.background(testForButtonInPreview ? .black : .blue).onTapGesture {
            
            /// (just a thought) might want to add an indicator to prevent people accidently reading things over and over again
                print("thing has been tapped")
            guard vm.charaDialogCount < (vm.currentRoom.personInRoom?.dialog.count ?? 0)-1 else{
                print("this part")
                vm.charaDialogCount = 0

                return
            }
            print("uhaha")
            vm.charaDialogCount += 1
            print("\(vm.charaDialogCount)")


            
        }
    }
}

struct CharaTextView_Previews: PreviewProvider {
    static var previews: some View {
        CharaTextView(vm: ViewModel())
    }
}
