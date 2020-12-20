//
//  RuneWarsRemoteApp.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI

@main
struct RuneWarsRemoteApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AppView( info: self.delegate).environmentObject(ArmyStore()).environmentObject(ChatModel())
                .environmentObject(PanicDeck())
        }
    }
 
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    @Published var email = ""
    @Published var uid = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
                
        return true

    }
    
    
}

struct RuneWarsRemoteApp_Previews: PreviewProvider {
    static var previews: some View {
        AppView(info: AppDelegate())
            .environmentObject(ArmyStore())
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
            //.previewLayout(.fixed(width:1000, height:700))
    }
}
