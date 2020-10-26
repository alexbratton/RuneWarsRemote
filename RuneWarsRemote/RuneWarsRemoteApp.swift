//
//  RuneWarsRemoteApp.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 6/23/20.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

@main
struct RuneWarsRemoteApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AppView( info: self.delegate).environmentObject(ArmyStore()).environmentObject(ChatModel())
        }
    }
 
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
    
    @Published var email = ""
    @Published var uid = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Initializeing Firebase
        FirebaseApp.configure()
        
        // Initializing Google
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true

    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
        print(error.localizedDescription)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard let user = user else{
            print(error.localizedDescription)
            return}
        
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        // Firebase Signin
        
        Auth.auth().signIn(with: credential) { (result,err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            self.email = (result?.user.email)!
            self.uid = (result?.user.displayName)!
        }    }
    
 
    
}

struct RuneWarsRemoteApp_Previews: PreviewProvider {
    static var previews: some View {
        AppView(info: AppDelegate())
            .environmentObject(ArmyStore())
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
            //.previewLayout(.fixed(width:1000, height:700))
    }
}
