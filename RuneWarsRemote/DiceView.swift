//
//  DiceView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct RedDiceView: View {
    let colorName: String = "Red"
    let colorValue: Color = Color.red
    @ObservedObject var diceModel: DiceModel
    
    
    //var diceValue: Int
    var body: some View {
        Stepper(colorName, onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        .background(colorValue)
        
    }
}
struct BlueDiceView: View {
    let colorName: String = "Blue"
    let colorValue: Color = Color.blue
    @ObservedObject var diceModel: DiceModel
    
    
    //var diceValue: Int
    var body: some View {
        Stepper(colorName, onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        .background(colorValue)
        
    }
}

struct WhiteDiceView: View {
    let colorName: String = "White"
    let colorValue: Color = Color.white
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
        Stepper(colorName, onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        .background(colorValue)
    }
}


struct DiceResultsSummaryView: View {
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
        HStack {
            orderTypeData[9].image
            Text("\(self.diceModel.diceResult.hit)")
            orderTypeData[26].image
            Text("\(self.diceModel.diceResult.lightning)")
            orderTypeData[18].image
            Text("\(self.diceModel.diceResult.mortal)")
            orderTypeData[17].image
            Text("\(self.diceModel.diceResult.rally)")
            orderTypeData[0].image
            Text("\(self.diceModel.diceResult.target)")
        }
    }
}

struct DiceView: View {
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Die Area")
            }
            HStack {
                DiceResultsSummaryView(diceModel: diceModel)
            }
            HStack {
                RedDiceView(diceModel: diceModel)
                BlueDiceView(diceModel: diceModel)
                WhiteDiceView(diceModel: diceModel)
            }
            .border(Color.black)
            
            Button(action : {
                self.diceModel.Rolldice()
            }) {
                Text("Roll")
            }
            Text(self.diceModel.rollResult)
        }
        //.border(Color.black)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))
        .frame(height:200)
        
    }
    
    
}


/**
struct OldDiceView: View {
    var body: some View {
        HStack
        {
            orderTypeData[8].image
            orderTypeData[9].image
            orderTypeData[9].image
            orderTypeData[18].image
            orderTypeData[26].image
        }
        .frame(height:200)

        
    }
}
**/

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceModel : DiceModel())
    }
}
