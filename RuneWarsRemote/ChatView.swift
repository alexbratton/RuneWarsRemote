//
//  ChatView.swift
//  RuneWarsRemote
//
//  Created by Alex Bratton on 7/29/20.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            Text("Chat Window!!!\n\nMore chat here!")
            Text("Chat Window!!!\n\nMore chat here!")
            Text("Chat Window!!!\n\nMore chat here!")
        }
        .frame(width:300)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth:1))

        
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
