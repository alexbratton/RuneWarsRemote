//
//  PanicCard.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 11/12/20.
//

import Foundation
struct PanicCard: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var description: String
}
