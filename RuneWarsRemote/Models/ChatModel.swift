//
//  ChatModel.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 9/7/20.
//

import Foundation
import Firebase

class ChatModel: NSObject, ObservableObject {
    
    @Published var signedIn: Bool = false
    @Published var chatMessages = [ChatMessage(uid : "Mark",message : "Please Sign In"),ChatMessage(uid : "Alex",message : "Please Sign In")]
    @Published var currentTurn: Int = 1
    @Published var currentRound: Int = 1
    @Published var firebaseInit : Bool = false
    
    
    var ref: DatabaseReference!
    var remoteConfig: RemoteConfig!
    var storageRef: StorageReference!
    fileprivate var _refHandle: DatabaseHandle?
    var messages: [DataSnapshot]! = []
    var msglength: NSNumber = 10
 
    
    struct ChatMessage: Identifiable, Codable,Hashable {
        var id = UUID()
        var uid : String
        var message: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    
    
    struct MessageFields {
        static let name = "name"
        static let text = "text"
        static let type = "type"
    }
    
    func incrementTurn()
    {
        self.currentTurn = self.currentTurn + 1
        sendDataMessage(dataMessage: "\(self.currentTurn)", dataType: "turn")
    }
    
    func decrementTurn()
    {
        self.currentTurn = self.currentTurn - 1
        sendDataMessage(dataMessage: "\(self.currentTurn)", dataType: "turn")
    }
    func incrementRound()
    {
        self.currentRound = self.currentRound + 1
        sendDataMessage(dataMessage: "\(self.currentRound)", dataType: "round")
    }
    
    func decrementRound()
    {
        self.currentRound = self.currentRound - 1
        sendDataMessage(dataMessage: "\(self.currentRound)", dataType: "round")
    }

    func sendMessage(newMessage: String)
    {
        //chatMessages.append(ChatMessage(uid : "Mark", message : newMessage))
        
        // Start the firebase/Google integration
        if (!firebaseInit) {
            configureFirebase()
        }
        let data = [MessageFields.text: newMessage, MessageFields.type: "chat"]
        sendFirebaseMessage(withData: data)
    }
    
    func sendDataMessage(dataMessage: String, dataType: String)
    {
        // Start the firebase/Google integration
        if (!firebaseInit) {
            configureFirebase()
        }
        let data = [MessageFields.text: dataMessage, MessageFields.type: dataType]
        sendFirebaseMessage(withData: data)
    }

    
    func sendFirebaseMessage(withData data: [String: String]) {
        var mdata = data
        mdata[MessageFields.name] = Auth.auth().currentUser?.displayName
        
        // Push data to Firebase Database
        self.ref.child("messages").childByAutoId().setValue(mdata)
    }

    
    
    func configureFirebase()
    {
        if (!firebaseInit) {
            configureDatabase()
            configureStorage()
            configureRemoteConfig()
            firebaseInit = true
        }
    }
    
    
    func configureDatabase() {
        ref = Database.database().reference()
        // Listen for new messages in the Firebase database
        _refHandle = self.ref.child("messages").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
            guard let strongSelf = self else { return }
            strongSelf.messages.append(snapshot)
            
            if let value = snapshot.value as? [String: Any] {
                let name = value[MessageFields.name] as? String ?? ""
                let text = value[MessageFields.text] as? String ?? ""
                let type = value[MessageFields.type] as? String ?? ""

                // If a chat, send to Chat
                if (type == "chat") {
                    strongSelf.chatMessages.append(ChatMessage(uid : name, message : text))
                }
                if (type == "dice") {
                    // Do something with the dice
                }
                if (type == "turn") {
                    // Swap the string to an int
                    let currentTurnIndicator = Int(text) ?? 1
                    strongSelf.currentTurn = currentTurnIndicator
                }
                if (type == "round") {
                    // Swap the string to an int
                    let currentRoundIndicator = Int(text) ?? 1
                    strongSelf.currentRound = currentRoundIndicator
                }
            }
            
        })
    }

    func configureRemoteConfig()
    {
        remoteConfig = RemoteConfig.remoteConfig()
        // Create Remote Config Setting to enable developer mode.
        // Fetching configs from the server is normally limited to 5 requests per hour.
        // Setting the fetch interval to zero allows many more requests to be made per
        // hour, so developers can test different config values during development.
        let remoteConfigSettings = RemoteConfigSettings()
        remoteConfigSettings.minimumFetchInterval = 0
        remoteConfig.configSettings = remoteConfigSettings
    }
    
    func configureStorage() {
        storageRef = Storage.storage().reference()
    }
 
    
    
}
