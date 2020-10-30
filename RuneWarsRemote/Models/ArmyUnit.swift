//
//  ArmyUnit.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/27/20.
//

import Foundation

struct ArmyUnit: Hashable, Identifiable, Decodable, Encodable {
    var id = UUID()
    var unitID: Int = 1000
    var name: String
    var size: String
    var notes: String
    var leftOrder: Int = 0
    var rightOrder: Int = 0
}

extension ArmyUnit {
    var unit: Unit {
        for theUnit in unitData {
            if (theUnit.id == unitID) {
                return theUnit
            }
        }
        return unitData[0]
    }
}

extension ArmyUnit {
    var selectedLeftOrder: UnitOrder {
        if (leftOrder==0)
        {
            return (UnitOrder(order: orderTypeData[0].name, color: OrderColor.white, initiative: 0))
            
        }
        else if (leftOrder==1)
        {
            return unit.leftDial.order1
        }
        else if (leftOrder==2)
        {
            return unit.leftDial.order2
        }
        else if (leftOrder==3)
        {
            return unit.leftDial.order3
        }
        else if (leftOrder==4)
        {
            return unit.leftDial.order4
        }
        else if (leftOrder==5)
        {
            return unit.leftDial.order5
        }
        else if (leftOrder==6)
        {
            return unit.leftDial.order6
        }
        else if (leftOrder==7)
        {
            return unit.leftDial.order7
        }
        else
        {
            return unit.leftDial.order8
        }
        
    }
    var selectedRightOrder: UnitOrder {
        if (rightOrder==0)
        {
            return (UnitOrder(order: orderTypeData[0].name, color: OrderColor.white, initiative: 0))
        }
        else if (rightOrder==1)
        {
            return unit.rightDial.order1
        }
        else if (rightOrder==2)
        {
            return unit.rightDial.order2
        }
        else if (rightOrder==3)
        {
            return unit.rightDial.order3
        }
        else if (rightOrder==4)
        {
            return unit.rightDial.order4
        }
        else if (rightOrder==5)
        {
            return unit.rightDial.order5
        }
        else if (rightOrder==6)
        {
            return unit.rightDial.order6
        }
        else if (rightOrder==7)
        {
            return unit.rightDial.order7
        }
        else
        {
            return unit.rightDial.order8
        }
    }
}


// Sample data to load for user's army
let testData = [
    ArmyUnit(unitID: 1000, name: "A My Spears", size: "3x2", notes: "1 These are lots of notes\n\nand here too"),
    ArmyUnit(unitID: 1001, name: "B My Cav", size: "2x1",notes: "2 These are lots of notes\n\nand here too"),
    ArmyUnit(unitID: 1001, name: "X My Cav #2", size: "3x2",notes: "3 These are lots of notes\n\nand here too 2")
]

