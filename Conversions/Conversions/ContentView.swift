//
//  ContentView.swift
//  Conversions
//
//  Created by Max Zhang on 12/14/20.
//

import SwiftUI

struct ContentView: View {
    @State var unitLength = ""
    @State var pickedLength = 0
    let unitLengths = [1, 10, 100, 1000]
    let convertedLengths = [0.001, 0.01, 0.1, 1]
    
    var body: some View {
        Form {
            Section(header: Text("Please Choose a Length in Meters")) {
                Picker("Unit Length", selection: $pickedLength) {
                    ForEach(0 ..< unitLengths.count) {
                        Text("\(unitLengths[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Converted to Kilometers")) {
                Text("\(convertedLengths[pickedLength], specifier: "%.3f") KM")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
