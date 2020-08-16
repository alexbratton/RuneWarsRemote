//
//  TurnPlan.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/16/20.
//

import SwiftUI

// main view for building army & setting orders

struct TurnPlan: View {
    @EnvironmentObject var store: ArmyStore
    
    var body: some View {
            List
            {
                //EditButton()
                /*
                ForEach(Array(store.army.enumerated()),id: \.element) { offset, element in
                    ArmyUnitRow(armyIndex: offset)
                }
                .onMove(perform: moveUnit)
                .onDelete(perform: deleteUnit)
*/


                ForEach(store.army.indices, id:\.self)
                {
                    i in
                    ArmyUnitRow(armyIndex: i)

                }
                .onMove(perform: moveUnit)
                .onDelete(perform: deleteUnit)
 
                
            }
    }
    
    func makeUnit() {
        withAnimation {
            store.army.append(ArmyUnit(unitID: 1000, name: "New spears", size: "2x2", notes: "From new button"))
        }
        
    }
    
    func moveUnit(from: IndexSet, to: Int)
    {
        withAnimation {
            store.army.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteUnit(offsets: IndexSet){
        withAnimation {
            store.army.remove(atOffsets: offsets)
        }
    }
    
        
}

/*
 UnitOverview(unit: armyUnit.unit))
{
 ArmyUnitRow(armyUnit: armyUnit)
}*/

struct TurnPlan_Previews: PreviewProvider {
    static var previews: some View {
        TurnPlan()
        //store: testStore)
            .previewLayout(.fixed(width:1000, height:700))

    }
}
