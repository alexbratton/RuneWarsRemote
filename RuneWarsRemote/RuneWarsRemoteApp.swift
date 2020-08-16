//
//  RuneWarsRemoteApp.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

@main
struct RuneWarsRemoteApp: App {
    
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(ArmyStore())
        }
    }
}

struct RuneWarsRemoteApp_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(ArmyStore())
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
            //.previewLayout(.fixed(width:1000, height:700))
    }
}
