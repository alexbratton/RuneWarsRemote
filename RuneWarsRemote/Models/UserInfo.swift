//
//  UserInfo.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 12/9/20.
//

import Foundation

class UserInfo: ObservableObject {
    let userID = UUID()
    @Published var username = ""
}
