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
            VStack{
                Text("Inventory").font(.custom(
                    "ChakraPetch-Bold",
                    
                    fixedSize: 18)).padding()
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.player.inventory.indices, id: \.self){ thing in
                            Button{
                                
                                
                                tappedOnItem = vm.player.inventory[thing]
                                print(tappedOnItem.itemImg)
                            }label:{
                                Image(vm.player.inventory[thing].itemImg ?? "")
                                    .resizable().scaledToFit()
                            }
                            
//                            vm.player.inventory.append(vm.player.inventory[thing])
                            //vm.thisThing.append(thing)
                        }
                        
                    } .padding(.horizontal)
                    
                    
                }.frame(maxWidth:300,maxHeight: 300)
                VStack{
                    HStack{
                        Image("\(tappedOnItem.itemImg ?? "")").resizable().scaledToFit()
                        VStack{
                            Section{
                                Text("""
                                                                         \(tappedOnItem.itemName ?? "")
                                         """).font(.custom(
                                            "ChakraPetch-Bold",
                                            
                                            fixedSize: 18)).padding()
                            }
                            
                            
                        }
                        
                    }.padding()
                    Text("\(tappedOnItem.itemDescription ?? "")").font(.custom(
                        "ChakraPetch-Light",
                        
                        fixedSize: 17)).padding()
                }.frame(maxWidth:300,maxHeight:300)
                
                
                
                
            }
            
            
        }.background(.gray)
        
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
}
