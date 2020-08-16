//
//  UnitList.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

struct UnitList: View {
    var faction: Unit.Faction
    @State var showingDetail = false

    
    var body: some View {
        NavigationView {
            List (unitData) { unit in
                if (unit.faction==faction)
                {
                    NavigationLink(destination:
                                    UnitOverview(unit:unit, isPresented: self.$showingDetail)) {
                        UnitRow(unit:unit)
                    }
                }
            }
        }
        
    }
}

struct UnitList_Previews: PreviewProvider {
    static var previews: some View {
        UnitList(faction: Unit.Faction.daqan)
    }
}
