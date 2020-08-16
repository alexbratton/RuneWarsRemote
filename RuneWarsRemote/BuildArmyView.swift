//
//  BuildArmyView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/27/20.
//

import SwiftUI

struct BuildArmyView: View {
    @ObservedObject var store: ArmyStore
    var faction: Unit.Faction
    
    var body: some View {
        ArmyUnitList(store: store)
        //.navigationTitle(Text("Build army for " + faction.rawValue))
    }
}

struct BuildArmyView_Previews: PreviewProvider {
    static var previews: some View {
        BuildArmyView(store: testStore,faction: Unit.Faction.daqan)
    }
}
