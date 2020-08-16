//
//  ArmyStore.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/18/20.
//

import Foundation

class ArmyStore: ObservableObject {
    
    @Published var army: [ArmyUnit] = []
    
    init(army: [ArmyUnit] = [])
    {
        self.army = army
    }
    
}

let testStore = ArmyStore(army: testData)
