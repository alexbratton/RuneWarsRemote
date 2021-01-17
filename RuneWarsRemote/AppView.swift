//
//  AppView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var info: AppDelegate
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            if verticalSizeClass == .compact || horizontalSizeClass == .compact {
                HeaderView(info: info)
            }
            else {
                Image("runewars-banner-thin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HeaderView(info: info)
            }
            
            TabView {
                AllView(info: info)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                ArmyTabView(info: info)
                    .tabItem {
                        Image(systemName: "list.number")
                        Text("Army")
                    }
                ChatDiceTabView(info: info)
                    .tabItem {
                        Image(systemName: "message")
                        Text("ChatDice")
                    }
                DiceTabView(info: info)
                    .tabItem {
                        Image(systemName: "message")
                        Text("Dice")
                    }
                ChatTabView(info: info)
                    .tabItem {
                        Image(systemName: "message")
                        Text("Chat")
                    }
            }
        }
    }
}

struct ChatDiceTabView: View {
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        VStack
        {
            ChatView(info: info)
            Spacer()
            DiceView()
        }
    }
}
struct DiceTabView: View {
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        DiceView()
    }
}
struct ChatTabView: View {
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        ChatView(info: info)
    }
}
struct ArmyTabView: View {
    @EnvironmentObject var store: ArmyStore
    
    @ObservedObject var info: AppDelegate
    var body: some View {
        
        VStack
        {
            HStack
            {
                Text("v1.0.2")
                    .font(.footnote)
                Spacer()
                
                Text("\(store.army.count) Units")
                    .foregroundColor(.secondary)
                Spacer()
                Image(systemName: "plus.circle")
                    .font(Font.system(.largeTitle))
                    .foregroundColor(Color.blue)
                    .animation(.spring())
                    .onTapGesture {
                        addUnit()
                        store.saveArmy()
                    }
                // Button("Add", action: addUnit)
                // Button("LOAD", action: loadArmy)
            }
            
            
            TurnPlan()
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))
        
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


struct AllView: View {
    @EnvironmentObject var store: ArmyStore
    @EnvironmentObject var chatModel: ChatModel
    @EnvironmentObject var panicDeck: PanicDeck
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        VStack
        {
            HStack (alignment: .top, spacing: 0.0)
            {
                ArmyTabView(info: info)
                Spacer()
                ChatDiceTabView(info: info)
            }
        }
        .onAppear(perform: store.loadSavedArmy)
        .onDisappear(perform: store.saveArmy)
    }
    
}

struct HeaderView: View {
    @ObservedObject var info : AppDelegate
    @EnvironmentObject var chatModel : ChatModel
    @EnvironmentObject var panicDeck: PanicDeck

 
    @State private var userName : String = UserDefaults.standard.string(forKey: "name_preference") ?? "NoName"
 

    var body: some View {
        HStack {
            ImageStore.shared.image(name: "morale")
                .background(Color.white)
                .onTapGesture
                {
                    let cardPick =  Int(arc4random_uniform(UInt32(panicDeck.deck.count)))
                    let card = panicDeck.deck[cardPick]
                    chatModel.sendMessage(newMessage : "(\(cardPick)) Panic! - \(card.name) (\(card.type)) -- \(card.description)")
                }
            Spacer()
            // Turn
            Text("Turn: \(chatModel.currentTurn)")
                .frame(width:80)
            Stepper("", onIncrement: {
                self.chatModel.incrementTurn()
                
            }, onDecrement: {
                self.chatModel.decrementTurn()
            }
            )
            .cornerRadius(8)
            .frame(width:60)
            
            Spacer()
            // Round
            Text("Initiative: \(chatModel.currentRound)")
                .frame(width:110)
            Stepper("", onIncrement: {
                self.chatModel.incrementRound()
                
            }, onDecrement: {
                self.chatModel.decrementRound()
            }
            )
            .cornerRadius(8)
            .frame(width:60)

            
            Spacer()
            Text("\(self.userName)")

            
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
