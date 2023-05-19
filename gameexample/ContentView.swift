//
//  ContentView.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var fadeInOut = false
    @State private var positionOfBackground = 0
    @State private var positionOfRoom2Background = 300
    @State private var room2 = false
    @State var boolThing = false
    @State var dialog = false
   
    var body: some View {
        ZStack{
            Image("background").offset(x:CGFloat(positionOfBackground))
           

            if boolThing {
                Rectangle()
                }
//
            if room2{
              //  room2View()
                Image("backgroundthingy").offset(x:CGFloat(positionOfRoom2Background))
//                if dialog{
//                    Image("personaguy")
//                    Image("textbox").resizable().frame(width:500,height:100).offset(y:200)
              //  }

            }
            VStack{
                Spacer().frame(height:670)
//                Button{
//                    withAnimation(.easeIn(duration: 1.0).delay(0.1)){
//                        boolThing.toggle()
//                    }
//
//                    withAnimation(.easeIn(duration: 1.2)){
//                        positionOfBackground -= 300
//                    }
//                    withAnimation(.easeIn(duration: 1.0).delay(4)){
//                        //StringForTheRoom = "room2"
//                    }
//                    withAnimation(.easeIn(duration: 1.0).delay(1)){
//
//                        room2.toggle()
//
//
//                    }
//                    withAnimation(.easeIn(duration: 1.0).delay(1.1)){
//                        positionOfRoom2Background -= 300
//                    }
//
//
//                }label: {
//                    Text("why isn't this working").onAppear(){
//                        withAnimation(Animation.easeInOut(duration: 0.6)
//                            .repeatForever(autoreverses: true)){
//                                fadeInOut.toggle()
//                            }
//                    }
//                    Image(systemName:"person.fill").onAppear(){
//                        withAnimation(Animation.easeInOut(duration: 0.6)
//                            .repeatForever(autoreverses: true)){
//                                fadeInOut.toggle()
//                            }
//                    }
//                }
                HStack{
                    
                    Image("ddr arrow").resizable().rotationEffect(.degrees(-90)).frame(width:50,height:50)
                        .padding()
                        .onTapGesture{
                        withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                            boolThing.toggle()
                        }

                        withAnimation(.easeIn(duration: 1.2)){
                            positionOfBackground -= 300
                        }
                        withAnimation(.easeIn(duration: 1.0).delay(4)){
                            //StringForTheRoom = "room2"
                        }
                        withAnimation(.easeIn(duration: 1.0).delay(1)){

                            room2.toggle()


                        }
                        withAnimation(.easeIn(duration: 1.0).delay(1.1)){
                            positionOfRoom2Background -= 300
                        }
                        
                        withAnimation(.easeIn(duration: 1.0).delay(2.1)){
                            dialog.toggle()
                          //  positionOfRoom2Background -= 300
                        }


                    }
                    Image("ddr arrow").resizable().rotationEffect(.degrees(90))
                        .frame(width:50,height:50)
                        .padding()
                        .onTapGesture{
                        withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                            boolThing.toggle()
                        }

                        withAnimation(.easeIn(duration: 1.2)){
                            positionOfBackground -= 300
                        }
                        withAnimation(.easeIn(duration: 1.0).delay(4)){
                            //StringForTheRoom = "room2"
                        }
                        withAnimation(.easeIn(duration: 1.0).delay(1)){

                            room2.toggle()


                        }
                        withAnimation(.easeIn(duration: 1.0).delay(1.1)){
                            positionOfRoom2Background -= 300
                        }
                        
                        withAnimation(.easeIn(duration: 1.0).delay(2.1)){
                            dialog.toggle()
                          //  positionOfRoom2Background -= 300
                        }
                        

                    }
                    
                    Spacer().frame(width:160)
                }
                
        }
            
            }
        
           
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
