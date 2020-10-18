//
//  ChatView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI
import GoogleSignIn


struct ChatView: View {
    @ObservedObject var chatModel : ChatModel
    @ObservedObject var info : AppDelegate

    var body: some View {
        VStack {
            HeaderView(chatModel: chatModel)
            Spacer()
            MessageView(chatModel: chatModel)
        }
    }
}

struct MessageView: View {
    @ObservedObject var chatModel : ChatModel
    
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(self.chatModel.chatMessages, id: \.id) { chat in
                    Text("\(chat.uid) : \(chat.message)")
                }
                .onDelete(perform: deleteChat)
            }
            
            
            HStack {
                TextField("", text: $newMessage)
                Button(action :{
                    sendMessage()
                }) {
                    Text("Send")
                
                }
                .cornerRadius(10)
            }
            .padding()
            .border(Color.black)
           
           
            
        }
        .frame(width:300)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))

        
    }
    
    func deleteChat(at offsets: IndexSet) {
        self.chatModel.chatMessages.remove(atOffsets: offsets)
    }
    
    func sendMessage() {
        self.chatModel.sendMessage(newMessage : newMessage)
        newMessage = ""
    }

}

struct HeaderView: View {
    @ObservedObject var chatModel : ChatModel
    
    var body: some View {
        HStack {
            Image("white_side_1")
            Spacer()
            Button(action :{
                signIn()
            }) {
                Text("Sign In")
                
            }
            .cornerRadius(10)
        }
        
    }
    
    func signIn() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
        print("Signed In")
    }
}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatModel : ChatModel(), info: AppDelegate())
    }
}
