//
//  test.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import SwiftUI

struct test: View {
    @State var rooms = 1
    @State private var imgurlthing = ""
    @State private var imgurlor = ""
    @State private var boolThingy2 = false
    @State private var boolforor = false
    @State private var scale = 1.0
    @State private var recthing = false
    var body: some View {
        ZStack{
            
                
            Image("\(imgurlor)")
            if boolforor == false {
                Image("\(imgurlthing)")
            }
           
                //.scaleEffect(scale)
//            if recthing{
//                Rectangle()
//            }
            HStack{
                Button("forward"){
                    //withAnimation(.easeIn(duration: //1.2)){
                        rooms += 1
                            if rooms == 1{
                                imgurlthing = "room1"
                            }else if rooms == 2{
                                imgurlthing = "room2"
                                //boolThingy2.toggle()
                            }else if rooms == 3{
                                imgurlthing = "backgroundthingy"
                            }
                   // }
                    scale = 1.0
                    withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                        scale += 1
                    }
                    withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                        recthing.toggle()
                    }
                    
                   
                    
                    print(rooms)
                    if rooms == 2{
                        boolThingy2 = true
                        
                    }else{
                        boolThingy2 = false
                    }
                    
                   
                    
                }
                
                Button("Go Back"){
                    rooms -= 1
                        if rooms == 1{
                            imgurlthing = "room1"
                        }else if rooms == 2{
                            imgurlthing = "room2"
                            //boolThingy2.toggle()
                        }else if rooms == 3{
                            imgurlthing = "backgroundthingy"
                        }
                    if rooms == 2{
                        boolThingy2 = true
                    }else{
                        boolThingy2 = false
                    }
                    withAnimation(.easeIn(duration: 1.0).delay(0.1)){
                        scale -= 1
                    }
                }
                if boolThingy2{
                    Button("Go Left"){
                        boolforor.toggle()
                        if boolforor{
                            imgurlor = "room"
                        }else{
                            imgurlor = ""
                        }
                    }
                }
                
               
                
            }
            
        }
        
       
    
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}


