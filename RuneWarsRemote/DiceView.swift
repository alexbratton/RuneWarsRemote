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
                .resizable()
                .frame(width: 30, height: 30)
                .padding(4.0)
            Stepper("", onIncrement: {
                self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
            }, onDecrement: {
                self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
            }
            )
            //.background(colorValue)
            .frame(width: 100)
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
                .resizable()
                .frame(width: 30, height: 30)
                .padding(4.0)

        Stepper("", onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        //.background(colorValue)
        .cornerRadius(8)
        .frame(width: 60)
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
                .resizable()
                .frame(width: 30, height: 30)
                .padding(4.0)

            
        Stepper("", onIncrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: 1)
        }, onDecrement: {
            self.diceModel.AddDie(dieColor : self.colorName,amount: -1)
        }
        )
        //.background(colorValue)
        .cornerRadius(8)
        .frame(width: 60)
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
            Text("\(self.diceModel.diceResult.surge)")
            orderTypeData[18].image
            Text("\(self.diceModel.diceResult.mortal)")
            orderTypeData[17].image
            Text("\(self.diceModel.diceResult.panic)")
            orderTypeData[32].image
            Text("\(self.diceModel.diceResult.target)")
        }
    }
}

struct DiceView: View {
    @State var diceModel: DiceModel = DiceModel()
    @EnvironmentObject var chatModel: ChatModel
    
    var body: some View {
        VStack {
            DiceResultView(diceModel: diceModel)
            HStack {
                DiceResultsSummaryView(diceModel: diceModel)
            }
            HStack {
                Spacer()
                RedDiceView(diceModel: diceModel)
                Spacer()
                BlueDiceView(diceModel: diceModel)
                Spacer()
                WhiteDiceView(diceModel: diceModel)
                Spacer()
                Button(action : {
                    self.diceModel.Rolldice(chatModel: chatModel)
                }) {
                    Text("Roll")
                }
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))
    }
    
    
}
struct DiceResultView: View {
    @ObservedObject var diceModel: DiceModel
    
    var body: some View {
            VStack {
               // Divider()
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
                }.frame(height: 100)
                //Divider()
                //Spacer()
        }
        .frame(height: 110)
        .border(Color.red)
    }
}

struct DieResultView: View {
    @ObservedObject var dieModel: DieModel
    @ObservedObject var diceModel: DiceModel
    @EnvironmentObject var chatModel: ChatModel

    var body: some View {
        VStack {
            Image(dieModel.getImageName())
            Button(action : {
                dieModel.rollDie()
                diceModel.SumDice()
                diceModel.sendRollResultToChat(chatModel: chatModel)
            }) {
                Text("ReRoll")
            }
            Button(action : {
                // Do nothing right now
                diceModel.sendRollResultToChat(chatModel: chatModel)
            }) {
                Text("Pick")
            }
        }
    }
}


struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
