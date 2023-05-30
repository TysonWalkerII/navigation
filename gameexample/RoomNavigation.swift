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
    @State var roomDialog = ""
    @State var showItemDescription = true
    let columns = [
        GridItem(.adaptive(minimum: 80))]
    @State var selectedItem = Item()
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
        ZStack{
            Image("\(vm.currentRoom.roompic)")
            Section{
                Section{
                    Image("\(vm.currentRoom.personInRoom?.portrait ?? "")").resizable().scaledToFit()
                }.frame(height:200)
                
                ProgressBarView(progress: vm.progress)
                
                if charaText != ""{
                    VStack(alignment: .leading){
                        Text(":::\(vm.currentRoom.personInRoom?.nameOfPerson ?? ""):::").font(.custom(
                            "ChakraPetch-Light",
                            
                            fixedSize: 16))
                        Text("\(charaText)").font(.custom(
                            "ChakraPetch-Light",
                            
                            fixedSize: 16))
                    }.padding(20).background(.gray)
                    
                }}.onTapGesture {
                    changeDialogue()}
            if showInventory {
                InventoryView(columns: columns, tappedOnItem: $selectedItem, vm: vm)
            }
            
            if vm.choices.count != 0 && !roomDialog.isEmpty {
                VStack{
                    Text("\(roomDialog)").font(.custom(
                        "ChakraPetch-Bold",
                        
                        fixedSize: 16)).padding().border(.black)
                    HStack{
                        ForEach(vm.choices) { choice in
                            Button{
                                if choice.effect == "column"{
                                    //  ForEach(vm.player.inventory) { thing in
                                    //  if thing.itemName == choice.effect{
                                    vm.player.inventory.removeAll { value in
                                        return value.itemName == "column"
                                    }
                                    //}
                                    // }
                                }
                                vm.useItem(item:choice.description)
                            }label: {
                                Section{VStack{
                                    Text(choice.description).foregroundColor(Color(.black)).font(.custom(
                                        "ChakraPetch-Bold",
                                        
                                        fixedSize: 16)).frame(maxWidth:130)
                                    Image(choice.image).resizable().scaledToFit()
                                }
                                    
                                }.frame(width:200,height:200)
                            }
                            
                            
                        }
                    }
                    
                    
                    
                }.padding().frame(maxWidth:350).background(.blue)
            }
            
            
            
            //
            //
            //                    ScrollView(.horizontal){
            //                        HStack{
            //                            ForEach(vm.player.inventory.indices, id: \.self){ thing in
            //                                Button{
            //                                    if vm.currentRoom.key?.itemName == vm.player.inventory[thing].itemName{
            //                                        vm.trash.itemsInTrash.append(vm.player.inventory[thing])
            //                                        vm.player.inventory.remove(at: thing)
            //                                        vm.currentRoom.locked.toggle()
            //                                    }
            //                                }label:{
            //                                    Image(vm.player.inventory[thing].itemImg ?? "")
            //                                        .resizable().frame(width:70,height:70)
            //                                }
            //                            }
            //                        }}.frame(width:400,height:70)
            //
            //
            //
            //            }else{
            //
            //            }
            
            
            
            
            
            VStack{
                //                Section{
                //                    // Triggers Dialog
                //                    Button("Chara dialog button"){
                //                        if charaDialogCount == charaDialog.count - 1 || charaDialogCount == charaDialog.count{
                //                            charaDialogCount = 0
                //                            charaText = ""
                //                        }else{
                //                            charaDialogCount += 1
                //                            charaText = charaDialog[charaDialogCount]
                //                        }
                //                    }
                //                }
                Section{
                    //Items in roomf
                    Text("Items in the room")
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(vm.currentRoom.itemsInRoom.indices, id: \.self){ thing in
                                Button{
                                    vm.player.inventory.append(vm.currentRoom.itemsInRoom[thing])
                                    vm.currentRoom.itemsInRoom.remove(at: thing)
                                }label:{
                                    Image(vm.currentRoom.itemsInRoom[thing].itemImg ?? "")
                                        .resizable().frame(width:70,height:70)
                                }
                            }
                        }}.frame(width:400,height:70)
                    
                    
                    
                }
                Section{
                    
                    
                    Button{
                        showInventory.toggle()
                    }label: {
                        Image(systemName: "capslock.fill").scaleEffect(2)
                    }
                }
                
            }.scaledToFill()}.scaledToFill()
        if showItemDescription{
            
        }
        
        
    }
    
    //    func ddrArrows(for direction: Direction) -> some View {
    //        ZStack {
    //
    //            let optionalRoomName = vm.currentRoom.connectedRooms[direction]!
    //            if let roomName = optionalRoomName {
    //                switch direction {
    //                case .forward:
    //                    // TODO: make these buttons. the buttons actions should change what room we're in
    //                    Button {
    //                        vm.changeLookOfRoom()
    //                    }
    //
    //                label:{
    //
    //                        Image("ddr arrow")
    //                            .resizable()
    //                            .frame(width:60,height:60)
    //                    }
    //
    //
    //                case .backward:
    //
    //                    Button{
    //                        if vm.currentRoom.locked == false{
    //                            guard let nameOfRoom = vm.currentRoom.backwardRoom else{
    //                                return
    //                            }
    //
    //                            vm.currentRoom.move(.backward)
    //
    //
    //                            print( Room.rooms["\(nameOfRoom)"])
    //                            print(nameOfRoom)
    //
    //                            vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: true, dialog: "", choices: [])
    //
    //                            //ROOM PIC
    //                            //CHARA PIC
    //                            charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
    //                            //CHARA DIALOG
    //                            vm.currentRoom.explored?.toggle()
    //                            if vm.currentRoom.personInRoom?.portrait != ""{
    //
    //                                charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
    //
    //                                charaText = charaDialog[0]
    //                                choices = vm.currentRoom.choices
    //                                print(vm.currentRoom.explored)
    //                            }else{
    //
    //                                charaImage = ""
    //                                charaDialogCount  = 1
    //                                charaDialog = [""]
    //                                charaText = ""
    //                            }
    //                        }else{
    //                            showAlert.toggle()
    //
    //                        }
    //                        roomDialog = vm.currentRoom.dialog ?? ""
    //                        choices = vm.currentRoom.choices
    //                        if choices.count != 0{
    //                            showChoice = true
    //                        }else{
    //                            print("empty dialog \(showChoice)")
    //                            print("\(choices)")
    //                        }
    //                    }label:{
    //                        if vm.currentRoom.locked == true{
    //                            Image("lock")
    //                                .resizable()
    //                                .frame(width:60,height:60)
    //                                .rotationEffect(.degrees(180))
    //                        }else{
    //                            Image("ddr arrow")
    //                                .resizable()
    //                                .frame(width:60,height:60)
    //                                .rotationEffect(.degrees(180))
    //                        }
    //
    //                    }.alert(isPresented: $showAlert) {
    //                        Alert(
    //                            title: Text("You are trapped here"),
    //                            message: Text("So long as I'm here to make sure of it, you aren't going anywhere")
    //                        )
    //                    }
    //
    //                case .left:
    //                    Button{
    //                        guard let nameOfRoom = vm.currentRoom.leftRoom else{
    //                            return
    //                        }
    //                        vm.currentRoom.move(.left)
    //                     //   print( Room.rooms["\(nameOfRoom)"])
    //                        print(nameOfRoom)
    //                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: true, dialog: "", choices: [])
    //                        //ROOM PIC
    //                        //CHARA PIC
    //                        charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
    //
    //                        //CHARA DIALOG
    //                        if vm.currentRoom.personInRoom?.portrait != ""{
    //                            charaText = charaDialog[0]
    //                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
    //                            print("\(charaDialog)")
    //                        }else{
    //
    //                            charaImage = ""
    //                            charaDialogCount  = 1
    //                            charaDialog = [""]
    //                            charaText = ""
    //                        }
    //                        roomDialog = vm.currentRoom.dialog ?? ""
    //                        choices = vm.currentRoom.choices
    //                        if choices.count != 0{
    //                            showChoice = true
    //                        }else{
    //                            print("empty dialog \(showChoice)")
    //                            print("\(choices)")
    //                        }
    //                    }label:{
    //                        Image("ddr arrow")
    //                            .resizable()
    //                            .frame(width:60,height:60)
    //                            .rotationEffect(.degrees(-90))}
    //                case .right:
    //                    Button{
    //                        guard let nameOfRoom = vm.currentRoom.rightRoom else{
    //                            return
    //                        }
    //                        vm.currentRoom.move(.right)
    //                        print( Room.rooms["\(nameOfRoom)"])
    //                        print(nameOfRoom)
    //                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: true, dialog: "", choices: [])
    //
    //                        //ROOM PIC
    //                        //CHARA PIC
    //                        //CHARA DIALOG
    //                        if charaImage != ""{
    //                            charaText = charaDialog[0]
    //                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
    //                            print("\(charaDialog)")
    //                        }else{
    //                            charaImage = ""
    //                            charaDialogCount  = 1
    //                            charaDialog = [""]
    //                            charaText = ""
    //                        }
    //                        roomDialog = vm.currentRoom.dialog ?? ""
    //                        choices = vm.currentRoom.choices
    //                        if choices.count != 0{
    //                            showChoice = true
    //                        }else{
    //                            print("empty dialog \(showChoice)")
    //                            print("\(choices)")
    //                        }
    //                        //showChoice.toggle()
    //                    }label:{
    //                        Image("ddr arrow")
    //                            .resizable()
    //                            .frame(width:60,height:60)
    //                            .rotationEffect(.degrees(90))
    //                    }
    //                }
    //            }
    //            else {
    //                EmptyView()
    //            }
    //        }
    //    }
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
