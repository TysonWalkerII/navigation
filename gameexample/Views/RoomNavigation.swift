//
//  RoomNavigation.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import SwiftUI

struct RoomNavigation: View {
    @StateObject var vm = ViewModel()
    @State var charaImage = ""
    @State var charaDialogCount  = 0
    @State var charaDialog = [""]
    @State var charaText = ""
    @State var showAlert = false
    @State public var showInventory = false
    @State var roomDialog = "nothing"
    @State var showItemDescription = true
    let columns = [
        GridItem(.adaptive(minimum: 80))]
    
    func changeDialogue(){
        if charaDialogCount == charaDialog.count - 1 || charaDialogCount == charaDialog.count{
            charaDialogCount = 0
            charaText = ""
        }else{
            charaDialogCount += 1
            charaText = charaDialog[charaDialogCount]
        }
    }
    
    var body: some View {
        ZStack(alignment:  Alignment(horizontal: .center, vertical: .center)){
            Image("\(vm.currentRoom.roompic)")
            Button{
                vm.changeLookOfRoom()
            }label: {
                Image(systemName: "door.right.hand.open").scaleEffect(5)
            }
//            Text((vm.currentRoom.key?.itemName)!)
//            CharaTextView(vm: vm)
            Doors()
            CharaTextView(vm: vm)
           
            if vm.showInventory {
          
            InventoryView(columns: columns, tappedOnItem: $vm.selectedItem, vm: vm)
            
            if showInventory {
                InventoryView(columns: columns, tappedOnItem: $vm.selectedItem, vm: vm)
            }

            
//            if vm.choices.count != 0 && !roomDialog.isEmpty {
//                RoomDialogView(vm: vm, dialogThing:vm.currentRoom.dialog ?? "")
//            }
            
            
        
            
            
            
            
            
            VStack{
//                Section{
//                    Image("\(vm.currentRoom.key?.itemImg)")
//                }
//                Section{
                   Button{
                        showInventory.toggle()
                    }label: {
                        Image(systemName: "backpack.fill").scaleEffect(2.5)
                    }
                    .offset(x: 170, y: -375)
//                }
                
            }.scaledToFill()
            
           
          
//                StealthBarView()
            
            
//            DoorButtonsNavigation(vm: vm)
            
        }.scaledToFill().onAppear(){
                print()
            }
        
        
        
        
    }
}

struct RoomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RoomNavigation()
            .previewDevice("iPhone 13")
            .previewDisplayName("13")
        RoomNavigation()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("14 Pro")
        RoomNavigation()
            .previewDevice("iPhone 14")
            .previewDisplayName("14")
        RoomNavigation()
            .previewDevice("iPhone 14 Plus")
            .previewDisplayName("14 Plus")
        RoomNavigation()
            .previewDevice("iPhone 14 Pro Max")
            .previewDisplayName("14 Pro Max")
    }
}
