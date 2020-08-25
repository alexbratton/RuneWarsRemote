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
            DiceResultView(diceModel: diceModel)
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
            //Text(self.diceModel.rollResult)
        }
        //.border(Color.black)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))
        .frame(height:300)
        
    }
    
    
}
struct DiceResultView: View {
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
            VStack {
                Divider()
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(diceModel.whiteDiceList) { dieModel in
                            DieResultView(dieModel: dieModel, diceModel : diceModel)
                        }
                        ForEach(diceModel.redDiceList) { dieModel in
                            DieResultView(dieModel: dieModel, diceModel : diceModel)
                        }
                        ForEach(diceModel.blueDiceList) { dieModel in
                            DieResultView(dieModel: dieModel, diceModel : diceModel)
                        }
                    }.padding()
                }.frame(height: 150)
                Divider()
                Spacer()
        }
        .frame(height: 150)
        .border(Color.red)
    }
}

struct DieResultView: View {
    @ObservedObject var dieModel: DieModel
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
        VStack {
            Image(dieModel.getImageName())
            Button(action : {
                // Do nothing right now
                print("Reroll Die")
                dieModel.rollDie()
                diceModel.SumDice()
            }) {
                Text("ReRoll")
            }
            Button(action : {
                // Do nothing right now
                print("Pick Die Face")
            }) {
                Text("Pick")
            }
        }
    }
}


struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceModel : DiceModel(count: 1))
    }
}
