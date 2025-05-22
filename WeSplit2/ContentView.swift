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
    var body: some View {
        NavigationStack{
            Button(
            "Tab Count \(tabCount)"
            ){
                tabCount += 1
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
// section{} groups it into sections

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
