//
//  DieModel.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 8/21/20.
//

import Foundation


class DieModel: ObservableObject, Identifiable {
    var id = UUID()

    @Published var dieResultSide: Int = 0
    @Published var dieResult: DiceResult
    @Published var dieColor: String


    init() {
        dieResultSide = 1
        dieResult = DiceResult()
        dieColor = "White"
    }
    
    init(dieColor : String)
    {
        self.dieColor = dieColor
        dieResultSide = 1
        dieResult = DiceResult()
    }
    
    init(dieSide : Int, diceResult : DiceResult,  dieColor : String)
    {
        self.dieColor = dieColor
        self.dieResultSide = dieSide
        self.dieResult = diceResult
    }
    
    func ResetResults() {
        dieResultSide = 0
    }

    func getImageName() -> String {
        var name : String
        
        name = "\(self.dieColor.lowercased())_side_\(self.dieResultSide)"
        
        print("Image Name: \(name)")
        return name
    }
    
    func rollDie() {
        if dieColor == "White" {
            RollWhiteDie()
        }
        if dieColor == "Red" {
            RollRedDie()
        }
        if dieColor == "Blue" {
            RollBlueDie()
        }
    }
    
    func RollBlueDie() {
        var diceResult : DiceResult = DiceResult()
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
        self.dieResultSide = dieSide
        self.dieResult = diceResult

    }
    func RollRedDie() {
        var diceResult : DiceResult = DiceResult()
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
        self.dieResultSide = dieSide
        self.dieResult = diceResult

    }
    
    func RollWhiteDie()  {
        var diceResult : DiceResult = DiceResult()
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
        
        self.dieResultSide = dieSide
        self.dieResult = diceResult
        
    }

}
