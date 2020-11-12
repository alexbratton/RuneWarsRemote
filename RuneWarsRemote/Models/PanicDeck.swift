//
//  PanicDeck.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 11/12/20.
//

import Foundation
class PanicDeck: ObservableObject {
    
    @Published var deck: [PanicCard]
    
    init()
    {
        self.deck = masterDeck
    }

    let masterDeck = [
        PanicCard(name: "Betrayal @@@", type: "DOUBT", description: "If the unit has more than 1 tray, it immediately performs a {Melee Attack} targeting itself. The dice for this attack cannot be rerolled, and only the {Hit} results are spent (ignore all other icons). The unit's front edge is treated as the contacted edge for this attack."),
        PanicCard(name: "Betrayal @@@", type: "DOUBT", description: "If the unit has more than 1 tray, it immediately performs a {Melee Attack} targeting itself. The dice for this attack cannot be rerolled, and only the {Hit} results are spent (ignore all other icons). The unit's front edge is treated as the contacted edge for this attack."),
        PanicCard(name: "Betrayal @@@", type: "DOUBT", description: "If the unit has more than 1 tray, it immediately performs a {Melee Attack} targeting itself. The dice for this attack cannot be rerolled, and only the {Hit} results are spent (ignore all other icons). The unit's front edge is treated as the contacted edge for this attack."),
        
        PanicCard(name: "Communications Breakdown @@", type: "CONFUSION", description: "Each of your units at range 1-2 of the unit receives 1 inspiration token."),
        PanicCard(name: "Communications Breakdown @@", type: "CONFUSION", description: "Each of your units at range 1-2 of the unit receives 1 inspiration token."),
        PanicCard(name: "Communications Breakdown @@", type: "CONFUSION", description: "Each of your units at range 1-2 of the unit receives 1 inspiration token."),

        PanicCard(name: "Disarray @", type: "CONFUSION", description: "The unit receives 1 stun token."),
        PanicCard(name: "Disarray @", type: "CONFUSION", description: "The unit receives 1 stun token."),
        PanicCard(name: "Disarray @", type: "CONFUSION", description: "The unit receives 1 stun token."),
        PanicCard(name: "Disarray @", type: "CONFUSION", description: "The unit receives 1 stun token."),

        
        PanicCard(name: "Discipline Breakdown @@@", type: "CONFUSION", description: "You choose and discard one upgrade card from the unit. If it was a figure upgrade, remove the corresponding figure."),
        PanicCard(name: "Discipline Breakdown @@@", type: "CONFUSION", description: "You choose and discard one upgrade card from the unit. If it was a figure upgrade, remove the corresponding figure."),

        
        PanicCard(name: "Flee in terror @@@", type: "FEAR", description: "The unit performs a {Reform}. You make all of the decisions for this action. Then, the unit performs a speed-2 {March}. It can perform this even if it is engaged with an enemy unit."),
        PanicCard(name: "Flee in terror @@@", type: "FEAR", description: "The unit performs a {Reform}. You make all of the decisions for this action. Then, the unit performs a speed-2 {March}. It can perform this even if it is engaged with an enemy unit."),

        
        PanicCard(name: "Frozen With Dread @", type: "FEAR", description: "The unit receives 1 immobilize token."),
        PanicCard(name: "Frozen With Dread @", type: "FEAR", description: "The unit receives 1 immobilize token."),
        PanicCard(name: "Frozen With Dread @", type: "FEAR", description: "The unit receives 1 immobilize token."),

        
        PanicCard(name: "Loss of Faith @@", type: "DOUBT", description: "If the unit has more than 1 tray, your opponent must choose and remove 1 tray from the unit's backmost rank. All figures on that tray are removed. This effect cannot be used to split the unit into two separate groups of trays."),
        PanicCard(name: "Loss of Faith @@", type: "DOUBT", description: "If the unit has more than 1 tray, your opponent must choose and remove 1 tray from the unit's backmost rank. All figures on that tray are removed. This effect cannot be used to split the unit into two separate groups of trays."),
        PanicCard(name: "Loss of Faith @@", type: "DOUBT", description: "If the unit has more than 1 tray, your opponent must choose and remove 1 tray from the unit's backmost rank. All figures on that tray are removed. This effect cannot be used to split the unit into two separate groups of trays."),

        PanicCard(name: "Rising Panic @", type: "FEAR", description: "The unit receives 2 panic tokens."),
        PanicCard(name: "Rising Panic @", type: "FEAR", description: "The unit receives 2 panic tokens."),
        PanicCard(name: "Rising Panic @", type: "FEAR", description: "The unit receives 2 panic tokens."),
        PanicCard(name: "Rising Panic @", type: "FEAR", description: "The unit receives 2 panic tokens."),
        PanicCard(name: "Rising Panic @", type: "FEAR", description: "The unit receives 2 panic tokens."),

        
        PanicCard(name: "Uncertainty @@", type: "FEAR", description: "The unit performs a {Reform}. You make all of the decisions for this action."),
        PanicCard(name: "Uncertainty @@", type: "FEAR", description: "The unit performs a {Reform}. You make all of the decisions for this action."),

        PanicCard(name: "Wavering Resolve @", type: "CONFUSION", description: "The unit discards all boons . If it had no boons, it receives 1 panic token."),
        PanicCard(name: "Wavering Resolve @", type: "CONFUSION", description: "The unit discards all boons . If it had no boons, it receives 1 panic token."),
        PanicCard(name: "Wavering Resolve @", type: "CONFUSION", description: "The unit discards all boons . If it had no boons, it receives 1 panic token.")

        
    ]
    
}

