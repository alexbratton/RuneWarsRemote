//
//  ContentView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           Text ("Content View)")
            //UnitOverview(unit: unitData[0])
        }
        //Text("Hello, world!").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewLayout(.device)
                
        }
            
    }
}
