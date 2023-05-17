//
//  RoomNavigation.swift
//  gameexample
//
//  Created by Cory Tripathy on 5/12/23.
//

import SwiftUI

struct RoomNavigation: View {
    @StateObject var vm = ViewModel()
    @State var crImage = ""
    @State var charaImage = ""
    @State var charaDialogCount  = 1
    @State var charaDialog = [""]
    @State var charaText = ""
    
    var body: some View {
        ZStack{
            Image("\(crImage)")
            Image("\(charaImage)")
                .resizable()
                .frame(height:100)
            Text("\(charaText)")
            VStack{
                Section{
                    // Triggers Dialog
                    Button("Chara dialog button"){
                        if charaDialogCount == charaDialog.count - 1 || charaDialogCount == charaDialog.count{
                            charaDialogCount = 0
                            charaText = ""
                        } else {
                            charaDialogCount += 1
                            charaText = charaDialog[charaDialogCount]
                        }
                    }
                }
                Section {
                    //Items in room
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(vm.currentRoom.itemsInRoom.indices, id: \.self){ index in
                                Button{
                                    vm.player.inventory.append(vm.currentRoom.itemsInRoom[index])
                                    vm.currentRoom.itemsInRoom.remove(at: index)
                                }label:{
                                    Image(vm.currentRoom.itemsInRoom[index].itemImg ?? "")
                                        .resizable().frame(width:70,height:70)
                                }
                            }
                        }
                    }.frame(width:400,height:70)
                }
                
                Section {
                    //Arrows
                    GeometryReader { geo in
                        HStack {
                            ForEach(vm.currentRoom.connectedRooms.keys.sorted(), id: \.self) { direction in
                                ddrArrows(for: direction)
                            }
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                        .ignoresSafeArea()
                    }
                }
            }
            .scaledToFit()
        }
    }
    
    func ddrArrows(for direction: Direction) -> some View {
        
        //        vm.currentRoom = vm.currentRoom.move(direction)
        //        //ROOM PICTURE
        //        crImage = vm.currentRoom.roompic
        //        //CHARA PIC
        //        charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
        //        //CHARA DIALOG
        
        let optionalRoomName = vm.currentRoom.connectedRooms[direction]!
        return ZStack {
            
            if optionalRoomName != nil {
                
                
                switch direction {
                case .forward:
                    Button{
                        //                        guard let nameOfRoom = vm.currentRoom.forwardRoom else{
                        //                            return
                        //                        }
                        vm.currentRoom = vm.currentRoom.move(direction)!
                        
                        if vm.currentRoom.personInRoom?.portrait != ""{
                            charaText = charaDialog[0]
                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
//                            print("\(charaDialog)")
//                            print("\(vm.currentRoom.itemsInRoom)")
                        }else{
                            
                            charaImage = ""
                            charaDialogCount  = 1
                            charaDialog = [""]
                            charaText = ""
                        }
                    } label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                    }
                case .backward:
                    Button{
                        //                        guard let nameOfRoom = vm.currentRoom.backwardRoom else{
                        //                            return
                        //                        }
                        
                        
                        if vm.currentRoom.personInRoom?.portrait != ""{
                            charaText = charaDialog[0]
                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
                            print("\(charaDialog)")
                        }else{
                            
                            charaImage = ""
                            charaDialogCount  = 1
                            charaDialog = [""]
                            charaText = ""
                        }
                        print(vm.currentRoom)
                        vm.currentRoom = vm.currentRoom.move(direction)!

                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(180))
                    }
                case .left:
                    Button{
                        //                        guard let nameOfRoom = vm.currentRoom.leftRoom else{
                        //                            return
                        //                        }
                        
                        if vm.currentRoom.personInRoom?.portrait != ""{
                            charaText = charaDialog[0]
                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
//                            print("\(charaDialog)")
                        } else {
                            charaImage = ""
                            charaDialogCount  = 1
                            charaDialog = [""]
                            charaText = ""
                        }
                        vm.currentRoom = vm.currentRoom.move(direction)!

                    } label: {
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(-90))
                    }
                case .right:
                    Button {
                        //                        guard let nameOfRoom = vm.currentRoom.rightRoom else{
                        //                            return
                        //                        }
                        
                        if charaImage != "" {
                            charaText = charaDialog[0]
                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
//                            print("\(charaDialog)")
                        } else {
                            charaImage = ""
                            charaDialogCount  = 1
                            charaDialog = [""]
                            charaText = ""
                        }
                        vm.currentRoom = vm.currentRoom.move(direction)!

                    } label: {
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(90))
                    }
                }
            }
        }
    }
}

struct RoomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RoomNavigation()
    }
}
