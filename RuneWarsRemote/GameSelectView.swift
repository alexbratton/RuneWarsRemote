//
//  GameSelectView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/27/20.
//

import SwiftUI

struct GameSelectView: View {
    @ObservedObject var store: ArmyStore

    var body: some View {
        NavigationView {
            VStack {
                Image("runewars-banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                NavigationLink(destination: FactionSelect(store: store))
                {
                    Text("Game Select")
                }
                Spacer()
            }
        }
        
        
    }
}

struct GameSelectView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectView(store: testStore)
    }
}
