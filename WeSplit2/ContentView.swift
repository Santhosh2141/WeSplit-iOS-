//
//  ContentView.swift
//  WeSplit2
//
//  Created by Santhosh Srinivas on 22/05/25.
//

import SwiftUI

struct ContentView: View {
    // in structs we can use mutating func to update property. but for var in swiftUI we use @State
//    @State private var tabCount = 0
//    @State private var name = ""
    // this is a 2 way binding. we bind the name to the text field and when we update the textfield it should update the variable using $. no dollar means only read
    
//    let detectives = ["Jake", "Amy", "Charles", "Rosa", "Terry"]
//    @State private var selectedDetective = "Jake"
    @State private var checkAmount = 0.0
    @State private var numOfPpl = 0
    @State private var tipPercent = 20
    @FocusState private var amountFocussed: Bool
    let tipPercentages = [5,10,15,20,25,30,0]
    
    var totalAmount: Double {
        let tipVal = Double(tipPercent)/100
        return (checkAmount + (tipVal*checkAmount))
    }
    var amtPerPerson: Double {
        let pplCount = Double(numOfPpl+2)
        let tipVal = Double(tipPercent)/100
        return (checkAmount + (tipVal*checkAmount))/pplCount
    }
//    mutating func totalDivided(checkAmount: Double, numOfPpl: Int, tipPercent: Int) -> Double{
//        var totalAmount: Double
//        var amount = checkAmount + (Double(tipPercent/100)*checkAmount)
//        totalAmount = amount / Double(numOfPpl)
//        return totalAmount
//    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Enter Your Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountFocussed)
                    // this checks if the amount field is focussed
                    // here 0 starts for 2 2ppl, 1 for 3 ppl etc
                    Picker("Number of People", selection: $numOfPpl) {
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    // for this to work we need a new view NavStack as we go to a bew page
//                    Picker("Tip Percent: ", selection: $tipPercent){
//                        ForEach(tipPercentages, id: \.self){
//                            Text("\($0) %")
//                        }
                    }
                    Section("How much have you tipped: "){
                        Picker("Tip Percent: ", selection: $tipPercent) {
                            ForEach(tipPercentages, id: \.self){ Text("\($0) %")
                            }
                        }
                        .pickerStyle(.segmented)
                }
                // THIS IS FOR THE CHALLENEGE PART
                Section("How much have you tipped: "){
                    Picker("Tip Percent: ", selection: $tipPercent) {
                        ForEach(0..<101){
                            Text("\($0) %")
                        }
                    }
                    .pickerStyle(.navigationLink)
            }
                Section("Total Bill: "){
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                Section("Amount payable per person"){
//                    var value = totalDivided(checkAmount: checkAmount, numOfPpl: numOfPpl, tipPercent: tipPercent)
                    Text(amtPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
            }
            .navigationTitle("We Split")
            .toolbar{
                if amountFocussed{
                    Button("Done") {
                        amountFocussed.toggle()
                    }
                }
            }
        }
    }
}
    
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
//        NavigationStack{
//            Form{
//                Picker("Select your student", selection: $selectedDetective){
//                    // forEach detective, unique value is id which is itself in the array
//                    ForEach(detectives, id: \.self){
//                        Text($0)
//                    }
//                }
//            }
//            .navigationTitle("Select a Detective")
//        }

// section{} groups it into sections

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
