//
//  FactionSelect.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/27/20.
//

import SwiftUI

struct FactionSelect: View {
    @ObservedObject var store: ArmyStore

    var body: some View {
        NavigationView {
        HStack {
            Spacer()
            VStack {
                Spacer()
                
                ZStack ()
                {
                    NavigationLink(destination: BuildArmyView(store: store, faction: Unit.Faction.daqan))
                    {
                    }
                    FactionView(store: store, faction: Unit.Faction.daqan)
                }
                ZStack ()
                {
                    NavigationLink(destination: BuildArmyView(store: store, faction: Unit.Faction.waiqar))
                    {
                    }
                    FactionView(store: store, faction: Unit.Faction.waiqar)
                }
                Spacer()
            }
            VStack {
                Spacer()
                ZStack ()
                {
                    NavigationLink(destination: BuildArmyView(store: store, faction: Unit.Faction.latari))
                    {
                    }
                    FactionView(store:store, faction: Unit.Faction.latari)
                }
                ZStack ()
                {
                    NavigationLink(destination: BuildArmyView(store: store, faction: Unit.Faction.uthuk))
                    {
                    }
                    FactionView(store: store, faction: Unit.Faction.uthuk)
                }
 
                Spacer()
            }
            Spacer()
        }
        .navigationBarTitle(Text("Select a Faction"))
        }
        
    }
}

struct FactionSelect_Previews: PreviewProvider {
    static var previews: some View {
        FactionSelect(store: testStore)
    }
}
