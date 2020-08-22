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
        HStack {
            Image("red_side_1")
            Spacer()
            Stepper("", onIncrement: {
                self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
            }, onDecrement: {
                self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
            }
            )
            .background(colorValue)
            .cornerRadius(8)
        }
        
    }
}
struct BlueDiceView: View {
    let colorName: String = "Blue"
    let colorValue: Color = Color.blue
    @ObservedObject var diceModel: DiceModel
    
    
    //var diceValue: Int
    var body: some View {
        HStack {
            Image("blue_side_1")
            Spacer()
        Stepper("", onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        .background(colorValue)
        }
    }
}

struct WhiteDiceView: View {
    let colorName: String = "White"
    let colorValue: Color = Color.white
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
        HStack {
            Image("white_side_1")
            Spacer()

        Stepper("", onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        .background(colorValue)
        .cornerRadius(8)
        }
        
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
                Image("red_side_1")
                Image("red_side_2")
                Image("red_side_3")
                Image("red_side_4")
                Image("red_side_5")
                Image("red_side_6")
                Image("red_side_7")
                Image("red_side_8")
            }
            HStack {
                Image("white_side_1")
                Image("white_side_2")
                Image("white_side_3")
                Image("white_side_4")
                Image("white_side_5")
                Image("white_side_6")
            }
            HStack {
                Image("white_side_7")
                Image("white_side_8")
                Image("white_side_9")
                Image("white_side_10")
                Image("white_side_11")
                Image("white_side_12")
            }
            HStack {
                Image("blue_side_1")
                Image("blue_side_2")
                Image("blue_side_3")
                Image("blue_side_4")
                Image("blue_side_5")
                Image("blue_side_6")
                Image("blue_side_7")
                Image("blue_side_8")
            }
           
            HStack {
                DiceResultsSummaryView(diceModel: diceModel)
            }
            
            HStack {
                RedDiceView(diceModel: diceModel)
                BlueDiceView(diceModel: diceModel)
                WhiteDiceView(diceModel: diceModel)
            }
            
            
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

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceModel : DiceModel())
    }
}
