//
//  ChatView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var info : AppDelegate
    @EnvironmentObject var chatModel : ChatModel
     
    var body: some View {
        VStack {
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
                TextField("", text: $newMessage,
                          onCommit: {
                            sendMessage()
                            self.newMessage = ""
                          }
                )
                Spacer()
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
                    if (chat.type == "chat") {
                         OtherUserMessageTextView(userName: chat.user, message: chat.message, chatType: chat.type)
                    }
                    if (chat.type == "dice") {
                        ChatDiceView(userName: chat.user,iconList: chat.data)
                    }
                    
                    if(chat.type == "orders") {
                        ChatOrderView(userName: chat.user,iconList: chat.data)
                    }
                }
                .onChange(of: self.chatModel.chatMessages) { target in
                    let index : Int = target.endIndex
                    let targetMessage : ChatModel.ReceivingChatMessage = target[index-1]
                    scrollView.scrollTo(targetMessage.id, anchor: .bottom)
                }
            }
        }
    }
    
}

// TODO map in order elements
struct ChatOrderView: View {
    var userName: String
    var iconList: [String]
    
    var body: some View {
        HStack {
            Text("\(userName)").font(.footnote)
                .foregroundColor(.white)
                .padding(3.0)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            ForEach(iconList, id: \.self) { iconName in
                ImageStore.shared.image(name: iconName)

                //Image("\(iconName)")
               
            }
            Spacer()
        }
    }
}


struct ChatDiceView: View {
    var userName: String
    var iconList: [String]
    
    var body: some View {
        HStack {
            Text("\(userName)").font(.footnote)
                .foregroundColor(.white)
                .padding(3.0)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            ForEach(iconList, id: \.self) { iconName in
                Image("\(iconName)")
               
            }
            Spacer()
        }
    }
}

struct OtherUserMessageTextView: View {
    var userName : String
    var message : String
    var chatType : String
    
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

struct HeaderViewOld: View {
    @EnvironmentObject var chatModel : ChatModel
    @EnvironmentObject var panicDeck: PanicDeck
    @ObservedObject var info : AppDelegate
    
    @State private var userName : String = UserDefaults.standard.string(forKey: "name_preference") ?? "NoName"

    var body: some View {
        HStack {
            ImageStore.shared.image(name: "morale")
                .background(Color.white)
                .onTapGesture
                {
                    let cardPick =  Int(arc4random_uniform(UInt32(panicDeck.deck.count)))
                    let card = panicDeck.deck[cardPick]
                    chatModel.sendMessage(newMessage : "(\(cardPick)) Panic! - \(card.name) (\(card.type)) -- \(card.description)")
                }
            Spacer()
            // Turn
            Text("Turn: \(chatModel.currentTurn)")
                .frame(width:80)
            Stepper("", onIncrement: {
                self.chatModel.incrementTurn()
              
            }, onDecrement: {
                self.chatModel.decrementTurn()
            }
            )
            .cornerRadius(8)
            .frame(width:60)
            
            Spacer()
            // Round
            Text("Initiative: \(chatModel.currentRound)")
                .frame(width:110)
            Stepper("", onIncrement: {
                self.chatModel.incrementRound()
                
            }, onDecrement: {
                self.chatModel.decrementRound()
            }
            )
            .cornerRadius(8)
            .frame(width:60)
            Spacer()
            Text("\(self.userName)")

        }
        
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(info: AppDelegate())
    }
}
