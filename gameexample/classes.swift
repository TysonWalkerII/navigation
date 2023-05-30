//
//  classes.swift
//  gameexample
//
//  Created by Tyson Laroyce Walker II on 5/9/23.
//

import Foundation
let vmir = ViewModel()
struct Room: Identifiable {
    
    let id = UUID()
    public var locked:Bool
    public var forwardRoom: String?
    public var backwardRoom: String?
    public var leftRoom: String?
    public var rightRoom: String?
    var personInRoom: Person?
    var itemsInRoom: [Item]
    var key:Item?
    var explored:Bool?
    var dialog:String?
    var choices:[Choice]
    
    var connectedRooms: [Direction: String?] {
        [.forward: forwardRoom,
         .backward: backwardRoom,
         .left: leftRoom,
         .right: rightRoom]
    }
    
    
    
    var roompic:String
    init(forwardRoom: String? = nil, backwardRoom: String? = nil, leftRoom: String? = nil, rightRoom: String? = nil, roompic: String, personInRoom:Person? = nil, itemsInRoom:[Item],locked:Bool,key:Item?,explored:Bool?,dialog:String?,choices:[Choice]) {
        self.forwardRoom = forwardRoom
        self.backwardRoom = backwardRoom
        self.leftRoom = leftRoom
        self.rightRoom = rightRoom
        self.roompic = roompic
        self.personInRoom = personInRoom
        self.itemsInRoom = itemsInRoom
        self.locked = locked
        self.key = key
        self.explored = explored
        self.dialog = dialog
        self.choices = choices
    }
    
    //maybe there can be a struct for choices and each player can have choices that work with the dialog every choice can have the property that is how it effects the person and stuff
    //TODO: add roomPics.  DONE
    static let yourCell = Room(forwardRoom: "exit", rightRoom: "yourSistersCell", roompic: "room", personInRoom: Person(portrait: "", dialog: [""], inventory: [], dialog2: [], choice: nil, nameOfPerson: nil), itemsInRoom: [], locked: false, key: nil, explored: false, dialog: nil, choices: [])
    static let yourSistersCell = Room(forwardRoom: "exit", leftRoom: "yourCell", roompic: "background",personInRoom: Person(portrait: "",dialog: [""], inventory: [], dialog2: [], choice: nil, nameOfPerson: nil), itemsInRoom: [], locked: false, key: nil, explored: false, dialog: "You see a cup of coffee on the floor, do you:", choices: [Choice(description: "Dring the random substance of a cup you just found on the floor of some random room", effect: "health - 1", image: "coffeecup"), Choice(description: "Leave it there", effect: "nothing", image: "skipuno")])
    static let exit = Room(forwardRoom: "guardsRoom", backwardRoom: "yourCell", roompic: "room2",personInRoom: Person(portrait: "botaningame",dialog: ["Hello","Are you lost too?", "good luck getting out", "I gave up a while ago ngl", "now I just jump on the bed all day", "beware...", "I heard theres some mysterious dude in the next room", "people never really return from there"], inventory: [], dialog2: ["????????","omg its u again","thats a lot of items"], choice: "highfive", nameOfPerson: "Botan Shishiro"), itemsInRoom: [Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column"),Item(itemImg: "column",itemName: "column")], locked: false, key: nil, explored: false, dialog: nil, choices: [])
   
    static let guardsRoom = Room(forwardRoom:"dangerZone",backwardRoom: "exit", roompic: "poolrooms", personInRoom: Person(portrait: "", dialog: [""], inventory: [], dialog2: [], choice: nil, nameOfPerson: nil), itemsInRoom: [ ], locked: false, key: nil, explored: false, dialog: nil, choices: [])
    static let dangerZone = Room(backwardRoom: "guardsRoom", roompic: "backgroundthingy", itemsInRoom: [], locked: true, key: Item(itemImg: "column", itemName: "column"), explored: false, dialog: "You enter the room and you are trapped, what do you do?", choices: [Choice(description: "Use Column to Unlock Door and RUN", effect: "column", image: "column"), Choice(description: "Stay There and Fight!", effect: "-3 health", image: "botan")])
    
    
    
    static let rooms: [String:Room] = ["yourCell":yourCell, "yourSistersCell": yourSistersCell, "exit":exit, "guardsRoom":guardsRoom, "dangerZone":dangerZone]
    
    //TODO: call this function when you tap a button to update the @published value in the view model
    func move(_ direction: Direction) -> Room? {
        switch direction {
            
        case .forward:
            
           // vmir.currentRoom =
           // print(rooms)
            
            guard let room = self.forwardRoom
            else {
                return nil
            }
            return Self.rooms[room]
        case .backward:
            guard let room = self.backwardRoom else {
                return nil
            }
            return Self.rooms[room]
        case .left:
            guard let room = self.leftRoom else {
                return nil
            }
            return Self.rooms[room]
        case .right:
            guard let room = self.rightRoom else {
                return nil
            }
            return Self.rooms[room]
        }
    }
}



struct Choice:Identifiable{
    let id = UUID()
    var description:String
    var effect:String
    var image:String
}

struct Trash: Identifiable {
    let id = UUID()
    var itemsInTrash: [Item]
}




class Building{
    var rooms: [Room] = []


    init(rooms:[Room]){
        self.rooms = rooms

    }





}




class Person: Identifiable{
    let id = UUID()
    public var hp: Int?
    public var portrait: String?
    public var dialog:[String]
    public var dialog2:[String]?
    public var inventory:[Item]
    public var choice:String?
    public var nameOfPerson:String?
    
    init(hp:Int? = nil, portrait:String?, dialog:[String],inventory:[Item], dialog2:[String], choice:String?, nameOfPerson:String?){
        self.hp = hp
        self.portrait = portrait
        self.dialog = dialog
        self.inventory = inventory
        self.dialog2 = dialog2
        self.nameOfPerson = nameOfPerson
    }
    static let playersItems = [Item(itemImg: "column",itemName: "column",itemDescription: "This beautiful column is used to open up doors and stuff thats about it"),Item(itemImg: "bucket",itemName: "Bucket of Cheese Ballz",itemDescription: "So delicious...just eat the whole thing")]
    static let player = Person(hp: 100, portrait: "botaningame", dialog: [], inventory: playersItems, dialog2: [], choice: nil, nameOfPerson: nil)
    
    
}

class Item :Identifiable{
    
    
    let id = UUID()
    public var itemImg:String?
    public var itemName:String?
    public var itemDescription:String?
     
    init(itemImg: String? = nil, itemName: String? = nil, itemDescription: String? = nil) {
        self.itemImg = itemImg
        self.itemName = itemName
        self.itemDescription = itemDescription
    }
    
   
    
    
}


//extension Item: Equatable{
//    static func == (lhs: Item, rhs: Item) -> Bool {
//        let someVariable = lhs.id == rhs.id && lhs.itemImg == rhs.itemImg &&
//        lhs.itemName == rhs.itemName &&
//        lhs.itemDescription == rhs.itemDescription
//        return someVariable
//    }
//}


