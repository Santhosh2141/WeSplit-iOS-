//
//  ContentView.swift
//  WeSplit2
//
//  Created by Santhosh Srinivas on 22/05/25.
//

import SwiftUI

struct ContentView: View {
    // in structs we can use mutating func to update property. but for var in swiftUI we use @State
    @State private var tabCount = 0
    @State private var name = ""
    // this is a 2 way binding. we bind the name to the text field and when we update the textfield it should update the variable using $. no dollar means only read
    
    let detectives = ["Jake", "Amy", "Charles", "Rosa", "Terry"]
    @State private var selectedDetective = "Jake"
    var body: some View {
//        NavigationStack{
//            Form{
//                TextField("Enter your name", text: $name)
//                Text("Your name is: \(name)")
//                Button(
//                "Tab Count \(tabCount)"
//                ){
//                    tabCount += 1
//                }
//                ForEach(0..<15) {
//                    Text("Row number \($0+1)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
        NavigationStack{
            Form{
                Picker("Select your student", selection: $selectedDetective){
                    // forEach detective, unique value is id which is itself in the array
                    ForEach(detectives, id: \.self){
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Detective")
        }
    }
}
// section{} groups it into sections

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
