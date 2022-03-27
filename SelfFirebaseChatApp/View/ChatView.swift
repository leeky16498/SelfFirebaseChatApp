//
//  ChatView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import SwiftUI

struct ChatView: View {
    
    let user : UserModel
    @State var text : String = ""
    @StateObject var vm = ChatViewModel()
    
    var body: some View {
                VStack {
                    ScrollView {
                        VStack{
                            ForEach(vm.messages) { message in
                                if message.fromID == FirebaseManager.shared.auth.currentUser?.uid {
                                    HStack {
                                        Spacer()
                                        HStack {
                                            Text(message.text)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(8)
                                    }
                                } else {
                                    HStack {
                                        HStack {
                                            Text(message.text)
                                                .foregroundColor(.black)
                                        }
                                        .padding()
                                        .background(.gray)
                                        .cornerRadius(8)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .background(.ultraThinMaterial)
                    
                    
                    HStack {
                        TextField("Insert message", text: $vm.messageText)
                            .textFieldStyle(.roundedBorder)
                            .padding(.trailing)
                        Button(action: {
                            vm.sendMessage(receiveUSer: user)
                        }, label: {
                            Text("Send")
                                .foregroundColor(.white)
                                .frame(width : 60, height : 30)
                                .background(.blue)
                                .cornerRadius(10)
                        })
                    }
                    .padding(.horizontal)
                    .onAppear {
                        vm.fetchMessages(receiveUser: user)
                    }
            }
            
            .navigationTitle("Chats with \(user.username) 📝")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(.stack)
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
