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
            ChatMessageView()
        }

    }
}

struct ChatMessageView: View {
    var body: some View {
        VStack {
            ChatMessagesView()
            Spacer()
            ChatButtonView()
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))
    }
}

struct ChatButtonView: View {
    @EnvironmentObject var chatModel : ChatModel

    @State private var newMessage: String = ""
    
    var body: some View {
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
    func sendMessage() {
        self.chatModel.sendMessage(newMessage : newMessage)
        newMessage = ""
    }
}

struct ChatMessagesView: View {
    @EnvironmentObject var chatModel : ChatModel
    
    var body: some View {
        ScrollView {
            ScrollViewReader { scrollView in
                
                ForEach(self.chatModel.chatMessages, id: \.id) { chat in
                    //TODO: Separate my chat and other chat
                    OtherUserMessageTextView(userName: chat.uid, message: chat.message)
                }
                .onDelete(perform: deleteChat)
                .onChange(of: self.chatModel.chatMessages) { target in
                    let index : Int = target.endIndex
                    let targetMessage : ChatModel.ChatMessage = target[index-1]
                    scrollView.scrollTo(targetMessage.id, anchor: .bottom)
                }
            }
        }
    }
    
    func deleteChat(at offsets: IndexSet) {
        self.chatModel.chatMessages.remove(atOffsets: offsets)
    }
}

struct OtherUserMessageTextView: View {
    var userName : String
    var message : String
    
    var body: some View {
        HStack {
            
            Text("\(userName)").font(.footnote)
                .foregroundColor(.white)
                .padding(3.0)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            Text("\(message)").font(.footnote)
                .padding(5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 2))
                )
            Spacer()
        }
    }
}

struct MyMessageTextView: View {
    var userName : String
    var message : String
    
    var body: some View {
        HStack {
            
            Text("\(userName)").font(.footnote)
                .padding(3.0)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
                .foregroundColor(.white)
            Text("\(message)").font(.footnote)
                .padding(5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 2))
                )
            Spacer()
            
        }
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
