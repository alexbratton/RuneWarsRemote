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
    var side = 0
}

class DiceModel: ObservableObject {
    
    @Published var rollResult: String = "Snake Eyes"
    @Published var diceResult: DiceResult
        
    @Published var whiteDiceList: Array<DieModel> = Array()
    @Published var redDiceList: Array<DieModel> = Array()
    @Published var blueDiceList: Array<DieModel> = Array()
    
    init() {
        diceResult = DiceResult()
    }
    
    // This constructor is for the preview
    init(count : Int) {
        diceResult = DiceResult()
        AddDie(dieColor: "White", amount: 1)
    }
    
    func ResetResults() {
        whiteDiceList = Array()
        redDiceList = Array()
        blueDiceList = Array()
    }
    

    func AddDie(dieColor : String, amount : Int) {
   
        var dieModel = DieModel(dieColor : dieColor)

        if dieColor == "White" {
            if amount > 0 {
                whiteDiceList.append(dieModel)
            }
            if amount < 0 {
                whiteDiceList.remove(at: 0)
            }
        }
        if dieColor == "Red" {
            if amount > 0 {
                redDiceList.append(dieModel)
            }
            if amount < 0 {
                redDiceList.remove(at: 0)
            }
        }
        if dieColor == "Blue" {
            if amount > 0 {
                blueDiceList.append(dieModel)
            }
            if amount < 0 {
                blueDiceList.remove(at: 0)
            }
        }
        
    }
    
 
    func RollWhiteDice() {
        for die in whiteDiceList {
            die.rollDie()
        }
    }
    
    func RollRedDice() {
        for die in redDiceList {
            die.rollDie()
        }
    }
    func RollBlueDice() {
        for die in blueDiceList {
            die.rollDie()
        }
    }
    func SumDice() {
        // blank out dice result first
        diceResult.hit = 0
        diceResult.lightning = 0
        diceResult.mortal = 0
        diceResult.rally = 0
        diceResult.side = 0
        diceResult.target = 0
        
        for die in whiteDiceList {
            AddResult(rollResult : die.dieResult)
        }
        for die in redDiceList {
            AddResult(rollResult : die.dieResult)
        }
        for die in blueDiceList {
            AddResult(rollResult : die.dieResult)
        }
    }
    
    func AddResult(rollResult : DiceResult) {
        
        diceResult.hit += rollResult.hit
        diceResult.lightning += rollResult.lightning
        diceResult.mortal += rollResult.mortal
        diceResult.rally += rollResult.rally
        diceResult.target += rollResult.target

    }
    
    func Rolldice() {
        // Roll White Dice
        RollWhiteDice()
        // Roll Red Dice
        RollRedDice()
        // Roll Blue Dice
        RollBlueDice()
        
        SumDice()
        PrintDie()
        
        rollResult = "Results:  Mortal: \(diceResult.mortal) Hit: \(diceResult.hit) Rally: \(diceResult.rally) Lightning: \(diceResult.lightning) Target: \(diceResult.target)"
    }
    
    func PrintDie()
    {
        print("White Count: \(whiteDiceList.count)")
        print("Red Count  : \(redDiceList.count)")
        print("Blue Count : \(blueDiceList.count)")
        
        for die in whiteDiceList {
            print("White     : \(die.dieResultSide)")
            print("  Hit       : \(die.dieResult.hit)")
            print("  Mortal    : \(die.dieResult.mortal)")
            print("  Lightning : \(die.dieResult.lightning)")
            print("  Rally     : \(die.dieResult.rally)")
            print("  Target    : \(die.dieResult.target)")
        }
        for die in redDiceList {
            print("Red       : \(die.dieResultSide)")
            print("  Hit       : \(die.dieResult.hit)")
            print("  Mortal    : \(die.dieResult.mortal)")
            print("  Lightning : \(die.dieResult.lightning)")
            print("  Rally     : \(die.dieResult.rally)")
            print("  Target    : \(die.dieResult.target)")
        }
        for die in blueDiceList {
            print("Blue      : \(die.dieResultSide)")
            print("  Hit       : \(die.dieResult.hit)")
            print("  Mortal    : \(die.dieResult.mortal)")
            print("  Lightning : \(die.dieResult.lightning)")
            print("  Rally     : \(die.dieResult.rally)")
            print("  Target    : \(die.dieResult.target)")
        }

    }
    
}
