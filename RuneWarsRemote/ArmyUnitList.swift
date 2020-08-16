//
//  ArmyUnitList.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/27/20.
//

import SwiftUI

struct ArmyUnitList: View {
    @ObservedObject var store: ArmyStore

    var body: some View {
            List (store.army) { armyUnit in
              //  ArmyUnitRow(armyUnit:armyUnit)

            }
            
        }
}


struct ArmyUnitList_Previews: PreviewProvider {
    static var previews: some View {
        ArmyUnitList(store: testStore)

    }
}

