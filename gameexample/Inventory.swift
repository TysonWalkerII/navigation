//
//  Inventory.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/15/23.
//

import SwiftUI

struct Inventory: View {
    @State var vm = ViewModel()
   
    var body: some View {
        Section{
            VStack{
                
//                ScrollView(.horizontal){
//                    HStack{
//                        ForEach(vm.player.inventory.indices, id: \.self){ thing in
//                            Image(vm.player.inventory[thing].itemImg ?? "").resizable().frame(width:70,height:70).onTapGesture {
//                                if vm.currentRoom.key?.itemName == vm.player.inventory[thing].itemName{
//                                vm.currentRoom.locked.toggle()
//                                    vm.player.inventory.remove(at: thing)
//                                print(thing)
//                                    vm.player.inventory = vm.player.inventory
//
//                                }
//
//                            }}}}.scrollIndicators(.hidden).frame(width:400,height:70)
                
                
               //     Inventory(vm: vm)
                    
                    Text("Inventory")
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(vm.player.inventory.indices, id: \.self){ thing in
                                    Button{
                                        if vm.currentRoom.key?.itemName == vm.player.inventory[thing].itemName{
                                            vm.trash.itemsInTrash.append(vm.player.inventory[thing])
                                            vm.player.inventory.remove(at: thing)
                                            vm.currentRoom.locked.toggle()
                                        }
                                    }label:{
                                        Image(vm.player.inventory[thing].itemImg ?? "")
                                            .resizable().frame(width:70,height:70)
                                    }
                                }
                            }}.frame(width:400,height:70)
                        
                    
                  
                
            }
            
            
        }.background(.gray)
    }
}

struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        Inventory()
    }
}
