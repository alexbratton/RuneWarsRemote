//
//  AppView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var store: ArmyStore
    @EnvironmentObject var chatModel: ChatModel
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        VStack
        {
            Image("runewars-banner-thin")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack (alignment: .top, spacing: 0.0)
            {
                VStack
                {
                    HStack
                    {
                        Spacer()

                        Text("\(store.army.count) Units")
                            .foregroundColor(.secondary)
                        Spacer()
                        Button("Add", action: addUnit)
                        Button("LOAD", action: loadArmy)
                    }

                    
                    TurnPlan()
                    Text("version 1.0.1")
                        .font(.footnote)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth:1))
                
                Spacer()
                
                VStack
                {
                    ChatView(info : info)
                    Spacer()
                    DiceView(diceModel : DiceModel())
                }
            }
        }
    }
    
    func loadArmy()
    {
        //store.objectWillChange.send()
        //store.army.removeAll()
        store.army =  load("myArmy.json")
    }
    
    func addUnit()
    {
        withAnimation {
            store.army.append(ArmyUnit(unitID: 111, name: "", size: "", notes: ""))
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppView(info: AppDelegate())
                .environmentObject(ArmyStore())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        }

    }
}
