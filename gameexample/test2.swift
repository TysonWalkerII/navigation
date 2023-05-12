////
////  test2.swift
////  gameexample
////
////  Created by Tyson Laroyce Walker II on 5/10/23.
////
////PURPOSE OF THIS FILE
////HOPEFULLY I CAN GET THE FUNCTIONALITY FOR THE NAVIGATION TO WORK WITH THE VARIABLES I MADE INSTEAD OF JUST IF STATEMENTS
//
//import SwiftUI
//
//struct test2: View {
//
//    var currentRoom = prison.rooms[3]
//
//
//    var body: some View {
//        ZStack{
//            Image("\(currentRoom.roompic)")
//            VStack{
//                Spacer().frame(height: 600)
//                HStack{
//                    ForEach(currentRoom.connectedRooms){ thing in
//                        if thing.roomType == "up"{
//                            Image("ddr arrow").resizable().frame(width:60,height:60)
//                        }
//                        if thing.roomType == "right"{
//                            Image("ddr arrow").resizable().frame(width:60,height:60).rotationEffect(.degrees(90))
//                        }
//                        if thing.roomType == "left"{
//                            Image("ddr arrow").resizable().frame(width:60,height:60).rotationEffect(.degrees(-90))
//                        }
//                        if thing.roomType == "down"{
//                            Image("ddr arrow").resizable().frame(width:60,height:60).rotationEffect(.degrees(180))
//                        }
//
//                        switch thing{
//                        case "up":
//                            Image("ddr arrow").resizable().frame(width:60,height:60)
//
//                        case "right":
//                            Image("ddr arrow").resizable().frame(width:60,height:60).rotationEffect(.degrees(90))
//                        case "left":
//                            Image("ddr arrow").resizable().frame(width:60,height:60).rotationEffect(.degrees(-90))
//                        case "down":
//                            Image("ddr arrow").resizable().frame(width:60,height:60).rotationEffect(.degrees(180))
//                        default:
//                            Image("")
//                        }
//
//                    }
//
//
//
//
//
//
//
//
//
//                }
//            }
//
//        }
//    }
//}
//
//struct test2_Previews: PreviewProvider {
//    static var previews: some View {
//        test2()
//    }
//}
