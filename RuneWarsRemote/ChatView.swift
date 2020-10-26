//
//  ChatView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI
import GoogleSignIn


struct ChatView: View {
    @ObservedObject var info : AppDelegate
    @EnvironmentObject var chatModel : ChatModel
    
 
    var body: some View {
        VStack {
            HeaderView(info : info)
            Spacer()
            MessageView()
        }

    }
}

struct MessageView: View {
    @EnvironmentObject var chatModel : ChatModel
    
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ScrollViewReader { scrollView in
                    LazyVStack {
                        ForEach(self.chatModel.chatMessages, id: \.id) { chat in
                            Text("\(chat.uid) : \(chat.message)")
                        }
                        .onDelete(perform: deleteChat)
                    }
                    .onAppear {
                        scrollView.scrollTo(self.chatModel.chatMessages[self.chatModel.chatMessages.endIndex - 1])
                    }
                }
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
    @EnvironmentObject var chatModel : ChatModel
    @ObservedObject var info : AppDelegate
    
    @State private var signedIn : Bool = false
    @State private var email : String = ""

    var body: some View {
        HStack {
            Spacer()
            if (self.signedIn) {
                Text("\(info.uid)")
            }
            else {
                Button(action :{
                    signIn()
                }) {
                    Text("Sign In")
                
                }
                .cornerRadius(10)
            }
        }
        
    }
    
    func signIn() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
        print("Signed In")
        // Now init firebase
        chatModel.configureFirebase()
        signedIn = true
       
    }
    

}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(info: AppDelegate())
    }
}
