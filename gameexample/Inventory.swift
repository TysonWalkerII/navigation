//
//  Inventory.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/15/23.
//

import SwiftUI

struct Inventory: View {
    @State var items = ViewModel().player.inventory
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(items){ thing in
                    Image(thing.itemImg ?? "").resizable().frame(width:70,height:70)
                }

            }
          //  Image("column")
        }.scrollIndicators(.hidden).frame(width:400,height:70)
        
    }
}

struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        Inventory()
    }
}
