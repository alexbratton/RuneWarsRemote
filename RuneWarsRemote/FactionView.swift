//
//  FactionView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/11/20.
//

import SwiftUI

struct FactionView: View {
    @ObservedObject var store: ArmyStore
    var faction: Unit.Faction
    
    var body: some View {
        Text("Faction view")
        /*
        HStack {
            ZStack (alignment: .bottom)
            {
                if (faction==Unit.Faction.daqan)
                {
                    Image("symbol-daqan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    NavigationLink(destination: BuildArmyView(faction: Unit.Faction.daqan))
                    {
                    Text("Daqan")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    }
                }
                else if (faction==Unit.Faction.waiqar)
                {
                    Image("symbol-waiqar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    NavigationLink(destination: BuildArmyView(faction: Unit.Faction.waiqar))
                    {
                    Text("Waiqar")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    }
                }
                else if (faction==Unit.Faction.latari)
                {
                    Image("symbol-latari")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    NavigationLink(destination: BuildArmyView(faction: Unit.Faction.latari))
                    {
                    Text("Latari")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    }
                }
                else if (faction==Unit.Faction.uthuk)
                {
                    Image("symbol-uthuk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    NavigationLink(destination: BuildArmyView(faction: Unit.Faction.daqan))
                    {
                    Text("Uthuk")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    }
                }
            }
        }
 
 */
 
    }
}

struct FactionView_Previews: PreviewProvider {
    static var previews: some View {
        FactionView(store: testStore, faction: Unit.Faction.daqan)
    }
}


 
