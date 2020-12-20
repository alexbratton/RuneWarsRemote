//
//  SettingsScreen.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 12/9/20.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject private var userInfo: UserInfo // 1
    
    private var isUsernameValid: Bool {
        !userInfo.username.trimmingCharacters(in: .whitespaces).isEmpty // 2
    }
    
    var body: some View {
        Form {
            Section(header: Text("Username")) {
                TextField("E.g. John Applesheed", text: $userInfo.username) // 3
//                NavigationLink("Continue", destination: ChatScreen()) // 4
//                    .disabled(!isUsernameValid)
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
