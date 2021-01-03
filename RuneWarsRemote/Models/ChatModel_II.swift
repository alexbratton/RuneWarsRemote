//
//  ChatModel_II.swift
//  RuneWarsRemote
//
//  Created by Mark Campbell on 12/9/20.
//
import SwiftUI

class ChatModel: NSObject, ObservableObject {
    
    @Published var signedIn: Bool = false
    @Published private(set) var chatMessages:  [ReceivingChatMessage] = []
    @Published var currentTurn: Int = 1
    @Published var currentRound: Int = 1
    @Published var firebaseInit : Bool = false
 
    var serverURL: String = "ws://192.168.1.10:8080/user"
    var echoURL: String = "ws://echo.websocket.org"

    var msglength: NSNumber = 10
    var urlSession: URLSession!
    private var webSocketTask: URLSessionWebSocketTask! // 1
    var username: String = UserDefaults.standard.string(forKey: "name_preference") ?? "NoName"
    var userID: UUID = UUID()
    

    struct ChatMessage: Identifiable, Codable,Hashable {
        var id = UUID()
        var uid : String
        var message: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    struct SubmittedChatMessage: Encodable {
        let message: String
        let user: String
        let type: String
        let userID: UUID
        let data: [String]
    }
    
    struct ReceivingChatMessage: Identifiable, Decodable, Equatable {
        let date: Date?
        let id: UUID = UUID()
        let message: String
        let user: String
        let userID: UUID?
        let type: String
        var data: [String]
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
            configureWebSocket()
        }
        transmitMessage(text: newMessage, messageType: "chat")
    }
    
    func sendDataMessage(dataMessage: String, dataType: String)
    {
        // Start the firebase/Google integration
        if (!firebaseInit) {
            configureWebSocket()
        }
        transmitMessage(text: dataMessage, messageType: dataType)
    }
    
    func sendDataMessage(dataMessage: String, dataType: String, dataArray: [String])
    {
        // Start the firebase/Google integration
        if (!firebaseInit) {
            configureWebSocket()
        }
        transmitMessage(text: dataMessage, messageType: dataType, dataArray: dataArray)
    }


    func configureWebSocket() {
        firebaseInit = true
        connect(username: username, userID: userID)
    }
    
    func connect(username: String, userID: UUID) { // 2
        self.username = username
        self.userID = userID
        
        
        let settingsURL = UserDefaults.standard.string(forKey: "settings_server_url") ?? echoURL
        let url = URL(string: settingsURL)!
        urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask.receive(completionHandler: onReceive) // 5
        webSocketTask.resume() // 6
    }
    
    func disconnect() { // 7
        webSocketTask.cancel(with: .normalClosure, reason: nil) // 8
    }
    
    private func disconnectEverything()
    {
        self.disconnect()
        DispatchQueue.main.async {
            self.firebaseInit = false
        }
    }
    
    private func reconnectEverything()
    {
        DispatchQueue.main.async {
            self.disconnect()
            self.firebaseInit = false
            self.sendMessage(newMessage: "Reconnecting to server")
        }
    }
    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        print("onReceive")
        
        // Nothing yet...

        webSocketTask.receive(completionHandler: onReceive) // 1
        if case .success(let message) = incoming { // 2
            onMessage(message: message)
        }
        else if case .failure(let error) = incoming { // 3
            self.reconnectEverything()
            print("Error", error)
        }
    }
    
    private func onMessage(message: URLSessionWebSocketTask.Message) { // 4
        print("onMessage \(message)")
        if case .string(let text) = message { // 5
            guard let data = text.data(using: .utf8),
                  let chatMessage = try? JSONDecoder().decode(ReceivingChatMessage.self, from: data)
            else {
                print("Failed to decode message")
                return
            }
            
            if (chatMessage.type == "chat")
            {
                DispatchQueue.main.async {
                    self.chatMessages.append(chatMessage)
                }
            }
            if (chatMessage.type == "orders") {
                // Do something with the dice
                print(chatMessage)
                DispatchQueue.main.async {
                    self.chatMessages.append(chatMessage)
                }
            }
            if (chatMessage.type == "dice") {
                // Do something with the dice
                
                DispatchQueue.main.async {
                    self.chatMessages.append(chatMessage)
                }
            }
            if (chatMessage.type == "turn") {
                // Swap the string to an int
                DispatchQueue.main.async {
                    let currentTurnIndicator = Int(chatMessage.message) ?? 1
                self.currentTurn = currentTurnIndicator
                }
            }
            if (chatMessage.type == "round") {
                // Swap the string to an int
                DispatchQueue.main.async {
                    let currentRoundIndicator = Int(chatMessage.message) ?? 1
                self.currentRound = currentRoundIndicator
                }
            }
        }
    }
        
    
    deinit { // 9
        disconnect()
    }
    
    
    func transmitMessage(text: String, messageType: String, dataArray: [String] = []) {
        print("sendChatMessage \(text)")

        let message = SubmittedChatMessage(message: text,user: self.username, type: messageType, userID: self.userID, data: dataArray) // 1
        guard let json = try? JSONEncoder().encode(message), // 2
              let jsonString = String(data: json, encoding: .utf8)
        else {
            return
        }
        print("about to send: \(jsonString)")
        webSocketTask.send(.string(jsonString)) { error in
            if let error = error {
                print("Error sending message", error)
                self.reconnectEverything()

                // TODO - disconnect, reconnect??
            }
        }
    }
    
    
}


