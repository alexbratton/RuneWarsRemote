//
//  DiceModel.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 8/17/20.
//

import Foundation

struct DiceResult {
    var lightning = 0
    var hit = 0
    var mortal = 0
    var rally = 0
    var target = 0
}

class DiceModel: ObservableObject {
    
    @Published var rollResult: String = "Snake Eyes"
    @Published var diceResult: DiceResult
    
    
    @Published var redDiceCount : Int = 0
    @Published var blueDiceCount : Int = 0
    @Published var whiteDiceCount : Int = 0
    
    
    init() {
        redDiceCount = 0
        blueDiceCount = 0
        whiteDiceCount = 0
        diceResult = DiceResult()
    }
    
    func AddRedDie() {
        redDiceCount+=1
    }
    func AddBlueDie() {
        blueDiceCount+=1
    }
    func AddWhiteDie() {
        whiteDiceCount+=1
    }
    func SubtractRedDie() {
        if (redDiceCount > 0) {
            redDiceCount-=1
        }
    }
    func SubtractBlueDie() {
        if (blueDiceCount > 0) {
            blueDiceCount-=1
        }
    }
    func SubtractWhiteDie() {
        if (whiteDiceCount > 0) {
            whiteDiceCount-=1
        }
    }
    func AddDie(dieColor : String, amount : Int) {
        
        if dieColor == "White" {
            whiteDiceCount += amount
            if whiteDiceCount < 0 {
                whiteDiceCount = 0
            }
        }
        if dieColor == "Red" {
            redDiceCount += amount
            if redDiceCount < 0 {
                redDiceCount = 0
            }
        }
        if dieColor == "Blue" {
            blueDiceCount += amount
            if blueDiceCount < 0 {
                blueDiceCount = 0
            }
        }
        
    }
    
    func RollWhiteDie()  {
        
        let dieSide = Int(arc4random_uniform(UInt32(12))) + 1
        
        switch dieSide {
        case 1:
            diceResult.hit = 0
        case 2:
            diceResult.hit = 1
        case 3:
            diceResult.hit = 1
            diceResult.lightning = 1
        case 4:
            diceResult.hit = 1
            diceResult.rally = 1
        case 5:
            diceResult.mortal = 1
        case 6:
            diceResult.hit = 2
        case 7:
            diceResult.hit = 1
        case 8:
            diceResult.lightning = 2
        case 9:
            diceResult.hit = 1
            diceResult.target = 1
        case 10:
            diceResult.rally = 1
            diceResult.lightning = 1
        case 11:
            diceResult.hit = 1
            diceResult.lightning = 1
        case 12:
            diceResult.hit = 1
        default:
            diceResult.hit = 0
        }
        
        
        
        
    }
    
    func RollRedDie() {
        
        let dieSide = Int(arc4random_uniform(UInt32(8))) + 1
        
        switch dieSide {
        case 1:
            diceResult.hit = 0
        case 2:
            diceResult.hit = 0
        case 3:
            diceResult.hit = 1
        case 4:
            diceResult.hit = 1
        case 5:
            diceResult.hit = 2
        case 6:
            diceResult.rally = 1
        case 7:
            diceResult.hit = 1
            diceResult.rally = 1
        case 8:
            diceResult.hit = 1
            diceResult.lightning = 1
        default:
            diceResult.hit = 0
        }
        
        
    }
    
    func RollBlueDie() {
        
        let dieSide = Int(arc4random_uniform(UInt32(8))) + 1
        
        switch dieSide {
        case 1:
            diceResult.hit = 0
        case 2:
            diceResult.hit = 1
        case 3:
            diceResult.hit = 1
        case 4:
            diceResult.hit = 1
            diceResult.lightning = 1
        case 5:
            diceResult.lightning = 2
        case 6:
            diceResult.lightning = 1
        case 7:
            diceResult.hit = 1
            diceResult.target = 1
        case 8:
            diceResult.target = 1
            
        default:
            diceResult.hit = 0
        }
    }
    
    /**
     func addDiceResults(_ currentTotal : inout DiceResult, _ addTotal : DiceResult)
     {
     currentTotal.hit += addTotal.hit
     currentTotal.lightning  += addTotal.lightning
     currentTotal.mortal += addTotal.mortal
     currentTotal.rally += addTotal.rally
     }
     **/
    
    func RollWhiteDice() {
        
        if whiteDiceCount < 1 {
            return
        }
        
        for _ in 1...whiteDiceCount {
            //roll a White Dice
            RollWhiteDie()
        }
        
        
    }
    
    func RollRedDice() {
        if redDiceCount < 1 {
            return
        }
        for _ in 1...redDiceCount {
            //roll a White Dice
            RollRedDie()
        }
        
        
    }
    func RollBlueDice() {
        
        if blueDiceCount < 1 {
            return
        }
        
        for _ in 1...blueDiceCount {
            //roll a White Dice
            RollBlueDie()
        }
        
        
    }
    
    func Rolldice() {
        
        // Roll White Dice
        RollWhiteDice()
        // Roll Red Dice
        RollRedDice()
        // Roll Blue Dice
        RollBlueDice()
        
        PrintDie()
        
        rollResult = "Results:  Mortal: \(diceResult.mortal) Hit: \(diceResult.hit) Rally: \(diceResult.rally) Lightning: \(diceResult.lightning) Target: \(diceResult.target)"
    }
    
    func PrintDie()
    {
        print("Hit       : \(diceResult.hit)")
        print("Mortal    : \(diceResult.mortal)")
        print("Lightning : \(diceResult.lightning)")
        print("Rally     : \(diceResult.rally)")
        print("Target    : \(diceResult.target)")
    }
    
}
