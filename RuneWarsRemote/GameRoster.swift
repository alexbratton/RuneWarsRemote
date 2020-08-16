//
//  GameRoster.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/11/20.
//

import SwiftUI

struct GameRoster: View {
    @State private var factionSelection=Unit.Faction.daqan
    @ObservedObject var store: ArmyStore

    var body: some View {
        VStack {
            HStack  {
                FactionView(store: store, faction: Unit.Faction.daqan)
                    .padding( 4.0)
                    .onTapGesture {
                        factionSelection=Unit.Faction.daqan
                    }
                    .background((factionSelection==Unit.Faction.daqan) ? Color.yellow : Color.white)
                FactionView(store: store, faction: Unit.Faction.waiqar)
                    .padding( 4.0)
                    .onTapGesture {
                        factionSelection=Unit.Faction.waiqar
                    }
                    .background((factionSelection==Unit.Faction.waiqar) ? Color.yellow : Color.white)
                FactionView(store: store, faction: Unit.Faction.latari)
                    .padding( 4.0)
                    .onTapGesture {
                        factionSelection=Unit.Faction.latari
                    }
                    .background((factionSelection==Unit.Faction.latari) ? Color.yellow : Color.white)
                FactionView(store: store, faction: Unit.Faction.uthuk)
                    .padding( 4.0)
                    .onTapGesture {
                        factionSelection=Unit.Faction.uthuk
                    }
                    .background((factionSelection==Unit.Faction.uthuk) ? Color.yellow : Color.white)
            }
            UnitList(faction: factionSelection)
            Spacer()
        }
    }
}

struct GameRoster_Previews: PreviewProvider {
    static var previews: some View {
        GameRoster(store: testStore)
    }
}
