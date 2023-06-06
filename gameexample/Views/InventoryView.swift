//
//  InventoryView.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/30/23.
//

import SwiftUI

struct InventoryView: View {
    let columns: [GridItem]
    @Binding var tappedOnItem: Item
    @ObservedObject var vm: ViewModel
    var body: some View {
        
        Section{
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                InventoryBoxView()
                   // .offset(x: 25, y:30)
               
                    VStack{
                        HStack{
                            Spacer().frame(width:250)
                            Button{
                                print("changing the boolean")
                                vm.showInventory.toggle()
                            } label:{
                                Image(systemName: "multiply.circle").foregroundColor(.white)
                           
                            }
                            
                          
                        }
                        HStack {
                            Text("INVENTORY").font(.custom("ChakraPetch-Bold", size: 21)).padding().foregroundColor(.white)
                            Text("HISTORY").font(.custom("ChakraPetch-Bold", size: 21)).padding().foregroundColor(.white)
                        }
                        ScrollView{
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(vm.player.inventory.indices, id: \.self){ thing in
                                    Button{
                                        
                                        
                                        tappedOnItem = vm.player.inventory[thing]
                                        print(tappedOnItem.itemImg!)
                                        //                                        if vm.currentRoom.key?.itemName == vm.player.inventory[thing].itemName{
                                        //                                            vm.trash.itemsInTrash.append(vm.player.inventory[thing])
                                        //                                            vm.player.inventory.remove(at: thing)
                                        //                                            vm.currentRoom.locked.toggle()
                                        //                                            showInventory.toggle()
                                        //                                        }else{
                                        //                                            VStack{
                                        //                                                //                                                Image("\(vm.player.inventory[thing].itemImg)")
                                        //                                                //                                                Text(vm.player.inventory[thing].itemName ?? "")
                                        //                                                //                                                Text(vm.player.inventory[thing].itemDescription ?? "")
                                        //                                                Rectangle()
                                        //                                            }
                                        //
                                        //                                        }
                                    }label:{
                                        Image(vm.player.inventory[thing].itemImg ?? "")
                                            .resizable().scaledToFit()
                                            .border(.white)
                                            .padding(3)
                                    }
                                }
                                
                            } .padding(.horizontal)
                            
                            
                        }.frame(width:300,height: 300)
                        VStack{
                            HStack{
                                Image("\(tappedOnItem.itemImg ?? "")").resizable().scaledToFit()
                                    .border(.white)
                                VStack{
                                    Section{
                                        Text("""
                                         \(tappedOnItem.itemName ?? "")
                                         """).font(.custom(
                                            "ChakraPetch-Bold",
                                            fixedSize: 18)).padding().foregroundColor(.white)
                                    }
                                    
                                    
                                }
                                
                            }.padding()
                            Text("\(tappedOnItem.itemDescription ?? "")").font(.custom(
                                "ChakraPetch-Light",
                                
                                fixedSize: 17)).padding().foregroundColor(.white)
                        }.frame(maxWidth:300,maxHeight:300)
                        
                        
                        
                        
                    }
                    
                    
                }
                
            }
            }
        } 
    struct InventoryDummyView: View {
        @State var tappedOnItem = Item(itemImg: "column",itemName: "column")
        @StateObject var vm = ViewModel()
        var body: some View {
            InventoryView(columns: [
                GridItem(.adaptive(minimum: 80))], tappedOnItem: $tappedOnItem, vm: vm)
        }
    }
    
    struct InventoryView_Previews: PreviewProvider {
        static var previews: some View {
            InventoryDummyView()
        }
