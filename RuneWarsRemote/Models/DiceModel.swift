//
//  DiceModel.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 8/17/20.
//

import Foundation

struct DiceResult {
    var surge = 0
    var hit = 0
    var mortal = 0
    var panic = 0
    var target = 0
    var side = 0
    var iconList : [String] = []
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
        diceResult.surge = 0
        diceResult.mortal = 0
        diceResult.panic = 0
        diceResult.side = 0
        diceResult.target = 0
        // Reset Icon List
        diceResult.iconList = []
        
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
        diceResult.surge += rollResult.surge
        diceResult.mortal += rollResult.mortal
        diceResult.panic += rollResult.panic
        diceResult.target += rollResult.target
        
        diceResult.iconList.append(contentsOf: rollResult.iconList)
    }
    
    func Rolldice(chatModel: ChatModel) {
        

        
        // Roll White Dice
        RollWhiteDice()
        // Roll Red Dice
        RollRedDice()
        // Roll Blue Dice
        RollBlueDice()
        
        SumDice()
        //PrintDie()
        sendRollResultToChat(chatModel: chatModel)
    }
    
    func sendRollResultToChat(chatModel: ChatModel)
    {
        rollResult = "Results:  Mortal: \(diceResult.mortal) Hit: \(diceResult.hit) Panic: \(diceResult.panic) Surge: \(diceResult.surge) Target: \(diceResult.target)"
        chatModel.sendMessage(newMessage: rollResult)
        
        // Put the results in a format that can be parsed out for icons
        var dataRollResult = ""
        // convert the array to a string
        for iconName in diceResult.iconList {
            if dataRollResult.isEmpty {
                dataRollResult = "\(iconName)"
            }
            else{
                dataRollResult = "\(dataRollResult)|\(iconName)"
            }
        }
        chatModel.sendDataMessage(dataMessage: dataRollResult, dataType: "dice", dataArray: diceResult.iconList)

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
            print("  Surge     : \(die.dieResult.surge)")
            print("  Panic     : \(die.dieResult.panic)")
            print("  Target    : \(die.dieResult.target)")
        }
        for die in redDiceList {
            print("Red       : \(die.dieResultSide)")
            print("  Hit       : \(die.dieResult.hit)")
            print("  Mortal    : \(die.dieResult.mortal)")
            print("  Surge     : \(die.dieResult.surge)")
            print("  Panic     : \(die.dieResult.panic)")
            print("  Target    : \(die.dieResult.target)")
        }
        for die in blueDiceList {
            print("Blue      : \(die.dieResultSide)")
            print("  Hit       : \(die.dieResult.hit)")
            print("  Mortal    : \(die.dieResult.mortal)")
            print("  Surge     : \(die.dieResult.surge)")
            print("  Panic     : \(die.dieResult.panic)")
            print("  Target    : \(die.dieResult.target)")
        }

    }
    
}
