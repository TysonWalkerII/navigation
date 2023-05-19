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
    @State var charaDialogCount  = 0
    @State var charaDialog = [""]
    @State var charaText = ""
    @State var showAlert = false
    @State public var showInventory = false
    @State var roomDialog = ""
    @State var choices:[Choice] = []
    @State var showChoice = false
    @State var showItemDescription = true
    let data = (1...100).map { "Item \($0)" }
    let columns = [
        GridItem(.adaptive(minimum: 80))]
    
    func changeDialogFunction(){
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
            Image("\(crImage)")
            Section{
                Section{
                    Image("\(charaImage)").resizable().scaledToFit()
                }.frame(height:200)
                
                
                
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
                    changeDialogFunction()}
            if showInventory{
                Section{
                    VStack{
                        Text("Inventory").font(.custom(
                            "ChakraPetch-Bold",

                            fixedSize: 18)).padding()
                        ScrollView{
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(vm.player.inventory.indices, id: \.self){ thing in
                                    Button{
                                        if vm.currentRoom.key?.itemName == vm.player.inventory[thing].itemName{
                                            vm.trash.itemsInTrash.append(vm.player.inventory[thing])
                                            vm.player.inventory.remove(at: thing)
                                            vm.currentRoom.locked.toggle()
                                            showInventory.toggle()
                                        }else{
                                            VStack{
                                                //                                                Image("\(vm.player.inventory[thing].itemImg)")
                                                //                                                Text(vm.player.inventory[thing].itemName ?? "")
                                                //                                                Text(vm.player.inventory[thing].itemDescription ?? "")
                                                Rectangle()
                                            }
                                            
                                        }
                                    }label:{
                                        Image(vm.player.inventory[thing].itemImg ?? "")
                                            .resizable().scaledToFit()
                                    }
                                }
                                
                            } .padding(.horizontal)
                           
                            
                        }.frame(maxWidth:300,maxHeight: 300)
                        VStack{
                            HStack{
                                Image("column").resizable().scaledToFit()
                                VStack{
                                    Section{
                                        Text("""
                                             superlongName of thinasdfsafasfsdfasfg
                                             """).font(.custom(
                                                "ChakraPetch-Bold",

                                                fixedSize: 18)).padding()
                                    }
                                    
                                    
                                }
                                
                            }.padding()
                            Text("Description of object. this rtext at the end is just to make the thing bigger to test if this thing works the right way").font(.custom(
                                "ChakraPetch-Light",

                                fixedSize: 17)).padding()
                        }.frame(maxWidth:300,maxHeight:300)
                        
                        
                        
                        
                    }
                    
                    
                }.background(.gray)
            }
           
            if showChoice && roomDialog != ""{
                VStack{
                    Text("\(roomDialog)").font(.custom(
                        "ChakraPetch-Bold",

                        fixedSize: 16)).padding().border(.black)
                    HStack{
                        ForEach(choices) { choice in
                            Button{
                                showChoice.toggle()
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
                    //Items in room
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
                    //Arrows
                    
                    GeometryReader { geo in
                        VStack{
                            Spacer().frame(height:250)
                            HStack {
                                ForEach(vm.currentRoom.connectedRooms.keys.sorted(), id: \.self) { direction in
                                    
                                    ddrArrows(for: direction)
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                //
                                
                            }.scaledToFit().background(.blue)
                                .frame(width: geo.size.width, height: geo.size.height)
                                .ignoresSafeArea()
                        }
                        
                    }
                }.scaledToFit()
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
    
    func ddrArrows(for direction: Direction) -> some View {
        ZStack {
            let optionalRoomName = vm.currentRoom.connectedRooms[direction]!
            if let roomName = optionalRoomName {
                switch direction {
                case .forward:
                    // TODO: make these buttons. the buttons actions should change what room we're in
                    Button{
                        
                        guard let nameOfRoom = vm.currentRoom.forwardRoom else{
                            return
                        }
                        vm.currentRoom.explored?.toggle()
                        vm.currentRoom.move(.forward)
                        print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: false, dialog: "", choices: [])
                        //ROOM PICTURE
                        crImage = vm.currentRoom.roompic
                        //CHARA PIC
                        charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
                        //CHARA DIALOG
                        vm.currentRoom.explored?.toggle()
                        if vm.currentRoom.personInRoom?.portrait != ""{
                            //MAYBE THE ROOMS NUMBER CAN GO UP EVERY TIME YOU ENTER IT, AND THE CHARACTER CAN USE THE DIALOG DEPENDING ON HOW MANY TIMER YOU HAVE ENTERED THE ROOM, MAYBE THERE CAN BE MANY DIFFERENT PIECES OF DIALOG THAT RANDOMLY SHOW UP INSTEAD
                            if vm.player.inventory.count > 10{
                                charaDialog = vm.currentRoom.personInRoom?.dialog2 ?? [""]
                            }else{
                                charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
                            }
                                
                                
                           
                            charaText = charaDialog[0]
                            
                            //ROOM DIALOG
                            
                            roomDialog = vm.currentRoom.dialog ?? ""
                            choices = vm.currentRoom.choices
                            if choices.count != 0{
                                showChoice = true
                            }else{
                                print("empty dialog \(showChoice)")
                                print("\(choices)")
                            }
                            
                          //  print("\(charaDialog)")
                          //  print("\(vm.currentRoom.itemsInRoom)")
                          //  print(vm.currentRoom.explored)
                            
                        }else{
                            
                            charaImage = ""
                            charaDialogCount  = 1
                            charaDialog = [""]
                            charaText = ""
                        }}label:{
                        
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                    }
                    
                    
                case .backward:
                    
                    Button{
                        if vm.currentRoom.locked == false{
                            guard let nameOfRoom = vm.currentRoom.backwardRoom else{
                                return
                            }
                           
                            vm.currentRoom.move(.backward)
                            
                            
                            print( Room.rooms["\(nameOfRoom)"])
                            print(nameOfRoom)
                            
                            vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: true, dialog: "", choices: [])
                            
                            //ROOM PIC
                            crImage = vm.currentRoom.roompic
                            //CHARA PIC
                            charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
                            //CHARA DIALOG
                            vm.currentRoom.explored?.toggle()
                            if vm.currentRoom.personInRoom?.portrait != ""{
                               
                                charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
                               
                                charaText = charaDialog[0]
                                choices = vm.currentRoom.choices
                                print(vm.currentRoom.explored)
                            }else{
                                
                                charaImage = ""
                                charaDialogCount  = 1
                                charaDialog = [""]
                                charaText = ""
                            }
                        }else{
                            showAlert.toggle()
                            
                        }
                        roomDialog = vm.currentRoom.dialog ?? ""
                        choices = vm.currentRoom.choices
                        if choices.count != 0{
                            showChoice = true
                        }else{
                            print("empty dialog \(showChoice)")
                            print("\(choices)")
                        }
                    }label:{
                        if vm.currentRoom.locked == true{
                            Image("lock")
                                .resizable()
                                .frame(width:60,height:60)
                                .rotationEffect(.degrees(180))
                        }else{
                            Image("ddr arrow")
                                .resizable()
                                .frame(width:60,height:60)
                                .rotationEffect(.degrees(180))
                        }
                        
                    }.alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("You are trapped here"),
                            message: Text("So long as I'm here to make sure of it, you aren't going anywhere")
                        )
                    }
                    
                case .left:
                    Button{
                        guard let nameOfRoom = vm.currentRoom.leftRoom else{
                            return
                        }
                        vm.currentRoom.move(.left)
                     //   print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: true, dialog: "", choices: [])
                        //ROOM PIC
                        crImage = vm.currentRoom.roompic
                        //CHARA PIC
                        charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
                        
                        //CHARA DIALOG
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
                        roomDialog = vm.currentRoom.dialog ?? ""
                        choices = vm.currentRoom.choices
                        if choices.count != 0{
                            showChoice = true
                        }else{
                            print("empty dialog \(showChoice)")
                            print("\(choices)")
                        }
                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(-90))}
                case .right:
                    Button{
                        guard let nameOfRoom = vm.currentRoom.rightRoom else{
                            return
                        }
                        vm.currentRoom.move(.right)
                        print( Room.rooms["\(nameOfRoom)"])
                        print(nameOfRoom)
                        vm.currentRoom = Room.rooms[nameOfRoom] ?? Room( roompic: "", itemsInRoom: [],locked:false, key:nil, explored: true, dialog: "", choices: [])
                        
                        //ROOM PIC
                        crImage = vm.currentRoom.roompic
                        //CHARA PIC
                        charaImage = vm.currentRoom.personInRoom?.portrait ?? ""
                        //CHARA DIALOG
                        if charaImage != ""{
                            charaText = charaDialog[0]
                            charaDialog = vm.currentRoom.personInRoom?.dialog ?? [""]
                            print("\(charaDialog)")
                        }else{
                            charaImage = ""
                            charaDialogCount  = 1
                            charaDialog = [""]
                            charaText = ""
                        }
                        roomDialog = vm.currentRoom.dialog ?? ""
                        choices = vm.currentRoom.choices
                        if choices.count != 0{
                            showChoice = true
                        }else{
                            print("empty dialog \(showChoice)")
                            print("\(choices)")
                        }
                        //showChoice.toggle()
                    }label:{
                        Image("ddr arrow")
                            .resizable()
                            .frame(width:60,height:60)
                            .rotationEffect(.degrees(90))
                    }
                }
            }
            else {
                EmptyView()
            }
        }
    }
}

struct RoomNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RoomNavigation()
    }
}
