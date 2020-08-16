//
//  Unit.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI
import Foundation

//struct Unit: Hashable, Codable, Identifiable {

struct Unit: Hashable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var faction: Faction
    var leftDial: CommandDial
     var rightDial: CommandDial
    
    enum Faction: String, CaseIterable, Codable, Hashable {
        case daqan = "Daqan"
        case waiqar = "Waiqar"
        case latari = "Latari"
        case uthuk = "Uthuk"
    }
}

enum OrderColor: String, CaseIterable, Codable, Hashable {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
    case white = "White"
    case yellow = "Yellow"
}


extension Unit {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
    var commandImage: Image {
        ImageStore.shared.image(name: imageName + "_commandtool")
    }
    var cardImage: Image {
        ImageStore.shared.image(name: "unit_"+imageName)
    }
}



struct UnitOrder: Hashable, Codable {
    var order: String
    var color: OrderColor
    var initiative: Int
}

extension UnitOrder {
    var orderType: OrderType {
        for theOrderType in orderTypeData {
            if (theOrderType.id == order) {
                return theOrderType
            }
        }
        return orderTypeData[0]
    }
}

struct DialOrder: Hashable, Codable {
    
}

struct CommandDial: Hashable, Codable {
    var order1: UnitOrder
    var order2: UnitOrder
    var order3: UnitOrder
    var order4: UnitOrder
    var order5: UnitOrder
    var order6: UnitOrder
    var order7: UnitOrder
    var order8: UnitOrder
}


