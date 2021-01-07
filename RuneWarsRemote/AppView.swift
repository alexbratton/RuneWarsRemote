//
//  AppView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        TabView {
            AllView(info: info)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ArmyTabView(info: info)
                .tabItem {
                    Image("AppIcon")
                    Text("Army")
                }
            ChatDiceTabView(info: info)
                .tabItem {
                    Image("AppIcon")
                    Text("ChatDice")
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
            Image("runewars-banner-thin")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
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

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppView(info: AppDelegate())
                .environmentObject(ArmyStore())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        }

    }
}
