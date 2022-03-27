//
//  ChatView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import SwiftUI

struct ChatView: View {
    
    @State var text : String = ""
    
    var body: some View {
        NavigationView {
                VStack {
                    ScrollView {
                        
                    }
                    HStack {
                        TextField("Insert message", text: $text)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                        Button(action: {
                            
                        }, label: {
                            Text("Send")
                                .foregroundColor(.white)
                                .frame(width : 60, height : 30)
                                .background(.blue)
                                .cornerRadius(10)
                        })
                    }
                    .padding(.horizontal)
            }
            
            .navigationTitle("Chats with Kyungyun 📝")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
