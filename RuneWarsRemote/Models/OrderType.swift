//
//  OrderType.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/24/20.
//

import Foundation

//
//  Unit.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

struct OrderType: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    fileprivate var imageName: String
}



extension OrderType {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

/*
 accuracy.png
 charge+1.png
 charge-1.png
 charge-turn-1.png
 charge-turn.png
 charge.png
 defense+1.png
 defense+stable.png
 hit-2.png
 hit.png
 march-1.png
 march-2.png
 march-3.png
 march-4.png
 march-nature.png
 march-unstable.png
 melee.png
 morale.png
 mortal.png
 natural.png
 rally.png
 ranged.png
 reform.png
 shift-1.png
 shift-2.png
 shift-nature.png
 skill.png
 stable.png
 surge.png
 turn-1.png
 turn.png
 unstable.png
 wheel-1.png
 wheel-2.png
 wheel.png
 */

