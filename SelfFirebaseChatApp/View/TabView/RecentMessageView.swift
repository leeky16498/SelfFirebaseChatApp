//
//  RecentMessageView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import SwiftUI

struct RecentMessageView: View {
    
    @StateObject var vm = RecentMessageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ForEach(vm.recentMessages) { recentMessage in
                        NavigationLink(destination: {
                            let uid = FirebaseManager.shared.auth.currentUser?.uid == recentMessage.fromID ? recentMessage.toID : recentMessage.fromID
                            let user = UserModel(uid: uid, email: recentMessage.email, profileImageUrl: recentMessage.profileImageUrl, fullname: recentMessage.fullname, username: recentMessage.username)
                            ChatView(user: user)
                        }, label: {
                            RecentMessageRowView(recentMessage: recentMessage)
                        })
                    }
                }
            }
            .navigationTitle("Recent Messages")
            .navigationViewStyle(.stack)
        }
    }
}

struct RecentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        RecentMessageView()
    }
}
