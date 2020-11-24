//
//  Data.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import UIKit
import SwiftUI

//let unitData: [Unit] = load("unitData.json")
let orderTypeData: [OrderType] = load("orderTypeData.json")
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

let unitData: [Unit] = [
    Unit(id: 111, name: "?", imageName: "newunit", faction: Unit.Faction.daqan,
         leftDial: CommandDial(
            order1: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order2: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order3: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order4: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order5: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order6: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order2: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order3: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order4: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order5: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order6: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
            )
    ), // PLACEHOLDER
         Unit(id: 1000, name: "Spearmen", imageName: "spearmen", faction: Unit.Faction.daqan,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 4),
                 order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 5),
                 order3: UnitOrder(order: "rally", color: OrderColor.green, initiative: 3),
                 order4: UnitOrder(order: "reform", color: OrderColor.green, initiative: 4),
                 order5: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 3),
                 order6: UnitOrder(order: "melee", color: OrderColor.yellow, initiative: 3),
                 order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 7),
                 order8: UnitOrder(order: "march-4", color: OrderColor.yellow, initiative: 8)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "wheel-2", color: OrderColor.blue, initiative: 0),
                 order3: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
                 order4: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
                 order5: UnitOrder(order: "defense+1", color: OrderColor.blue, initiative: 0),
                 order6: UnitOrder(order: "defense+1", color: OrderColor.green, initiative: 0),
                 order7: UnitOrder(order: "hit", color: OrderColor.red, initiative: 0),
                 order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
                 )
         ), // Spearmen


         Unit(id: 1001, name: "Oathsworn Cavalry", imageName: "oathsworn_cavalry", faction: Unit.Faction.daqan,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-1", color: OrderColor.blue, initiative: 3),
                 order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 4),
                 order3: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 5),
                 order4: UnitOrder(order: "march-4", color: OrderColor.blue, initiative: 7),
                 order5: UnitOrder(order: "rally", color: OrderColor.green, initiative: 3),
                 order6: UnitOrder(order: "reform", color: OrderColor.green, initiative: 8),
                 order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 7),
                 order8: UnitOrder(order: "melee", color: OrderColor.yellow, initiative: 3)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
                 order3: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
                 order4: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 0),
                 order5: UnitOrder(order: "skill", color: OrderColor.blue, initiative: 0),
                 order6: UnitOrder(order: "hit", color: OrderColor.red, initiative: 0),
                 order7: UnitOrder(order: "defense+1", color: OrderColor.white, initiative: 0),
                 order8: UnitOrder(order: "defense+1", color: OrderColor.white, initiative: 0)
                 )
         ), // Cavalry


         Unit(id: 1002, name: "Kari Wraithstalker", imageName: "kari_wraithstalker", faction: Unit.Faction.daqan,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 3),
                 order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 4),
                 order3: UnitOrder(order: "reform", color: OrderColor.green, initiative: 2),
                 order4: UnitOrder(order: "skill", color: OrderColor.green, initiative: 2),
                 order5: UnitOrder(order: "ranged", color: OrderColor.green, initiative: 2),
                 order6: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 5),
                 order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
                 order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "wheel-1", color: OrderColor.blue, initiative: 0),
                 order3: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
                 order4: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
                 order5: UnitOrder(order: "defense+1", color: OrderColor.green, initiative: 0),
                 order6: UnitOrder(order: "surge", color: OrderColor.red, initiative: 0),
                 order7: UnitOrder(order: "accuracy", color: OrderColor.red, initiative: 0),
                 order8: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0)
                 )
         ), // Kari Wraithstalker



         Unit(id: 1003, name: "Lord Hawthorne", imageName: "lord_hawthorne", faction: Unit.Faction.daqan,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 3),
                 order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 4),
                 order3: UnitOrder(order: "march-4", color: OrderColor.blue, initiative: 6),
                 order4: UnitOrder(order: "reform", color: OrderColor.green, initiative: 2),
                 order5: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 5),
                 order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 6),
                 order7: UnitOrder(order: "skill", color: OrderColor.yellow, initiative: 2),
                 order8: UnitOrder(order: "melee", color: OrderColor.yellow, initiative: 2)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
                 order3: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
                 order4: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 0),
                 order5: UnitOrder(order: "hit", color: OrderColor.red, initiative: 0),
                 order6: UnitOrder(order: "defense+1", color: OrderColor.white, initiative: 0),
                 order7: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0),
                 order8: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0)
                 )
         ), // Lord Hawthorne




         Unit(id: 1004, name: "Baron Zachareth", imageName: "baron_zachareth", faction: Unit.Faction.daqan,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-1", color: OrderColor.blue, initiative: 2),
                 order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 3),
                 order3: UnitOrder(order: "rally", color: OrderColor.blue, initiative: 4),
                 order4: UnitOrder(order: "shift-1", color: OrderColor.blue, initiative: 5),
                 order5: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 7),
                 order6: UnitOrder(order: "ranged", color: OrderColor.green, initiative: 5),
                 order7: UnitOrder(order: "march-2", color: OrderColor.green, initiative: 7),
                 order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
                 order3: UnitOrder(order: "defense+1", color: OrderColor.blue, initiative: 0),
                 order4: UnitOrder(order: "march-2", color: OrderColor.green, initiative: 0),
                 order5: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 0),
                 order6: UnitOrder(order: "reform", color: OrderColor.green, initiative: 0),
                 order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
                 order8: UnitOrder(order: "hit", color: OrderColor.white, initiative: 0)
                 )
         ), // Baron Zachareth


      Unit(id: 1005, name: "Rune Golems", imageName: "rune_golems", faction: Unit.Faction.daqan,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-unstable", color: OrderColor.blue, initiative: 4),
                 order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 8),
                 order3: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 7),
                 order4: UnitOrder(order: "skill", color: OrderColor.red, initiative: 3),
                 order5: UnitOrder(order: "melee", color: OrderColor.red, initiative: 5),
                 order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 5),
                 order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 5),
                 order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 5)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "defense+stable", color: OrderColor.red, initiative: 0),
                 order3: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0),
                 order4: UnitOrder(order: "reform", color: OrderColor.white, initiative: 0),
                 order5: UnitOrder(order: "reform", color: OrderColor.white, initiative: 0),
                 order6: UnitOrder(order: "reform", color: OrderColor.white, initiative: 0),
                 order7: UnitOrder(order: "reform", color: OrderColor.white, initiative: 0),
                 order8: UnitOrder(order: "reform", color: OrderColor.white, initiative: 0)
                 )
         ), // Rune Golems
    
    Unit(id: 1006, name: "Heavy Crossbowmen", imageName: "heavy_crossbowmen", faction: Unit.Faction.daqan,
            leftDial: CommandDial(
               order1: UnitOrder(order: "march-1", color: OrderColor.blue, initiative: 5),
               order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 6),
               order3: UnitOrder(order: "rally", color: OrderColor.green, initiative: 4),
               order4: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 6),
               order5: UnitOrder(order: "reform", color: OrderColor.green, initiative: 3),
               order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
               order7: UnitOrder(order: "ranged", color: OrderColor.yellow, initiative: 5),
               order8: UnitOrder(order: "ranged", color: OrderColor.yellow, initiative: 5)
               ),
            rightDial: CommandDial(
               order1: UnitOrder(order: "turn", color: OrderColor.blue, initiative: 0),
               order2: UnitOrder(order: "wheel-1", color: OrderColor.blue, initiative: 0),
               order3: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
               order4: UnitOrder(order: "hit", color: OrderColor.red, initiative: 0),
               order5: UnitOrder(order: "surge", color: OrderColor.yellow, initiative: 0),
               order6: UnitOrder(order: "march-1", color: OrderColor.white, initiative: 0),
               order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
               order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
               )
       ), // Heavy Crossbowmen
    
    Unit(id: 1007, name: "Outland Scouts", imageName: "outland_scouts", faction: Unit.Faction.daqan,
            leftDial: CommandDial(
               order1: UnitOrder(order: "march-1", color: OrderColor.blue, initiative: 3),
               order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 4),
               order3: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 6),
               order4: UnitOrder(order: "shift-2", color: OrderColor.green, initiative: 6),
               order5: UnitOrder(order: "rally", color: OrderColor.green, initiative: 7),
               order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
               order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
               order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4)
               ),
            rightDial: CommandDial(
               order1: UnitOrder(order: "turn", color: OrderColor.blue, initiative: 0),
               order2: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
               order3: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
               order4: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 0),
               order5: UnitOrder(order: "surge", color: OrderColor.red, initiative: 0),
               order6: UnitOrder(order: "reform", color: OrderColor.white, initiative: 0),
               order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
               order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
               )
       ), // Outland Scouts
    


    Unit(id: 2001, name: "Ardus Ix'Erebus", imageName: "ardus_ixerebus", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 4),
            order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 5),
            order3: UnitOrder(order: "reform", color: OrderColor.green, initiative: 3),
            order4: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 5),
            order5: UnitOrder(order: "melee", color: OrderColor.red, initiative: 3),
            order6: UnitOrder(order: "skill", color: OrderColor.yellow, initiative: 2),
            order7: UnitOrder(order: "skill", color: OrderColor.yellow, initiative: 2),
            order8: UnitOrder(order: "skill", color: OrderColor.yellow, initiative: 2)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "turn", color: OrderColor.blue, initiative: 0),
            order2: UnitOrder(order: "wheel-1", color: OrderColor.blue, initiative: 0),
            order3: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
            order4: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
            order5: UnitOrder(order: "hit", color: OrderColor.red, initiative: 0),
            order6: UnitOrder(order: "surge", color: OrderColor.red, initiative: 0),
            order7: UnitOrder(order: "defense+1", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0)
            )
    ), // Ardus
    Unit(id: 2002, name: "Ankaur Maro", imageName: "ankaur_maro", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 5),
            order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 6),
            order3: UnitOrder(order: "march-4", color: OrderColor.blue, initiative: 7),
            order4: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 6),
            order5: UnitOrder(order: "reform", color: OrderColor.green, initiative: 3),
            order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
            order7: UnitOrder(order: "ranged", color: OrderColor.red, initiative: 6),
            order8: UnitOrder(order: "skill", color: OrderColor.yellow, initiative: 8)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
            order2: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
            order3: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 0),
            order4: UnitOrder(order: "hit-2", color: OrderColor.red, initiative: 0),
            order5: UnitOrder(order: "surge", color: OrderColor.red, initiative: 0),
            order6: UnitOrder(order: "mortal", color: OrderColor.red, initiative: 0),
            order7: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0)
            )
    ), // Ankaur
    
    Unit(id: 2003, name: "Vorun'thul the Cursed", imageName: "lord_vorunthul", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-1", color: OrderColor.white, initiative: 3),
            order2: UnitOrder(order: "rally", color: OrderColor.white, initiative: 4),
            order3: UnitOrder(order: "march-2", color: OrderColor.white, initiative: 6),
            order4: UnitOrder(order: "march-3", color: OrderColor.white, initiative: 7),
            order5: UnitOrder(order: "melee", color: OrderColor.green, initiative: 3),
            order6: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 6),
            order7: UnitOrder(order: "march-4", color: OrderColor.green, initiative: 7),
            order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 5)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "reform", color: OrderColor.green, initiative: 0),
            order2: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 0),
            order3: UnitOrder(order: "wheel-1", color: OrderColor.green, initiative: 0),
            order4: UnitOrder(order: "surge", color: OrderColor.red, initiative: 0),
            order5: UnitOrder(order: "skill", color: OrderColor.blue, initiative: 0),
            order6: UnitOrder(order: "turn", color: OrderColor.blue, initiative: 0),
            order7: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
            order8: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0)
            )
    ), // Vorun
    
    Unit(id: 2004, name: "Carrion Lancers", imageName: "carrion_lancers", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 4),
            order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 5),
            order3: UnitOrder(order: "march-4", color: OrderColor.blue, initiative: 7),
            order4: UnitOrder(order: "reform", color: OrderColor.green, initiative: 3),
            order5: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 6),
            order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 5),
            order7: UnitOrder(order: "rally", color: OrderColor.yellow, initiative: 3),
            order8: UnitOrder(order: "skill", color: OrderColor.yellow, initiative: 6)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
            order2: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
            order3: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
            order4: UnitOrder(order: "defense+1", color: OrderColor.green, initiative: 0),
            order5: UnitOrder(order: "hit", color: OrderColor.red, initiative: 0),
            order6: UnitOrder(order: "morale", color: OrderColor.red, initiative: 0),
            order7: UnitOrder(order: "defense+1", color: OrderColor.yellow, initiative: 0),
            order8: UnitOrder(order: "march-3", color: OrderColor.yellow, initiative: 0)
            )
    ), // Death Knights
    Unit(id: 2005, name: "Death Knights", imageName: "death_knights", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-1", color: OrderColor.blue, initiative: 3),
            order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 5),
            order3: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 7),
            order4: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 9),
            order5: UnitOrder(order: "reform", color: OrderColor.green, initiative: 4),
            order6: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 6),
            order7: UnitOrder(order: "rally", color: OrderColor.green, initiative: 7),
            order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
            order2: UnitOrder(order: "charge+1", color: OrderColor.blue, initiative: 0),
            order3: UnitOrder(order: "charge-turn", color: OrderColor.blue, initiative: 0),
            order4: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 0),
            order5: UnitOrder(order: "reform", color: OrderColor.blue, initiative: 0),
            order6: UnitOrder(order: "mortal", color: OrderColor.red, initiative: 0),
            order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
            )
    ), // Carrion Lancers

         Unit(id: 2006, name: "Reanimates", imageName: "reanimates", faction: Unit.Faction.waiqar,
              leftDial: CommandDial(
                 order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 5),
                 order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 6),
                 order3: UnitOrder(order: "rally", color: OrderColor.green, initiative: 4),
                 order4: UnitOrder(order: "reform", color: OrderColor.green, initiative: 5),
                 order5: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 7),
                 order6: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
                 order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4),
                 order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 4)
                 ),
              rightDial: CommandDial(
                 order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
                 order2: UnitOrder(order: "wheel-2", color: OrderColor.blue, initiative: 0),
                 order3: UnitOrder(order: "charge-1", color: OrderColor.blue, initiative: 0),
                 order4: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
                 order5: UnitOrder(order: "defense+1", color: OrderColor.green, initiative: 0),
                 order6: UnitOrder(order: "morale", color: OrderColor.red, initiative: 0),
                 order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
                 order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
                 )
         ), // Reanimates
    
    Unit(id: 2007, name: "Reanimate Archers", imageName: "reanimate_archers", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 6),
           order2: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 7),
            order3: UnitOrder(order: "reform", color: OrderColor.green, initiative: 2),
            order4: UnitOrder(order: "shift-1", color: OrderColor.green, initiative: 6),
            order5: UnitOrder(order: "shift-2", color: OrderColor.green, initiative: 7),
            order6: UnitOrder(order: "ranged", color: OrderColor.red, initiative: 5),
            order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 9),
            order8: UnitOrder(order: "melee", color: OrderColor.red, initiative: 9)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "turn-1", color: OrderColor.blue, initiative: 0),
            order2: UnitOrder(order: "wheel-1", color: OrderColor.blue, initiative: 0),
            order3: UnitOrder(order: "rally", color: OrderColor.green, initiative: 0),
            order4: UnitOrder(order: "surge", color: OrderColor.red, initiative: 0),
            order5: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order6: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0)
            )
    ), // Reanimates
    
    Unit(id: 2008, name: "Wraiths", imageName: "wraiths", faction: Unit.Faction.waiqar,
         leftDial: CommandDial(
            order1: UnitOrder(order: "march-1", color: OrderColor.blue, initiative: 3),
            order2: UnitOrder(order: "march-2", color: OrderColor.blue, initiative: 4),
            order3: UnitOrder(order: "march-3", color: OrderColor.blue, initiative: 6),
            order4: UnitOrder(order: "march-4", color: OrderColor.blue, initiative: 7),
            order5: UnitOrder(order: "shift-2", color: OrderColor.green, initiative: 6),
            order6: UnitOrder(order: "reform", color: OrderColor.red, initiative: 4),
            order7: UnitOrder(order: "melee", color: OrderColor.red, initiative: 6),
            order8: UnitOrder(order: "melee", color: OrderColor.yellow, initiative: 4)
            ),
         rightDial: CommandDial(
            order1: UnitOrder(order: "turn", color: OrderColor.blue, initiative: 0),
            order2: UnitOrder(order: "wheel-1", color: OrderColor.blue, initiative: 0),
            order3: UnitOrder(order: "charge", color: OrderColor.blue, initiative: 0),
            order4: UnitOrder(order: "charge-turn-1", color: OrderColor.blue, initiative: 0),
            order5: UnitOrder(order: "melee", color: OrderColor.red, initiative: 0),
            order6: UnitOrder(order: "morale", color: OrderColor.yellow, initiative: 0),
            order7: UnitOrder(order: "skill", color: OrderColor.white, initiative: 0),
            order8: UnitOrder(order: "rally", color: OrderColor.white, initiative: 0)
            )
    ) // Reanimates
    
      
     ]
 






let armyUnitData: [ArmyUnit] = [
    ArmyUnit(unitID: 1000, name: "My Spears", size: "3x2", notes: "1 These are lots of notes\n\nand here too"),
    ArmyUnit(unitID: 1001, name: "My Cav", size: "2x1",notes: "2 These are lots of notes\n\nand here too"),
    ArmyUnit(unitID: 1001, name: "My Cav #2", size: "3x2",notes: "3 These are lots of notes\n\nand here too 2")
]



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).png from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
