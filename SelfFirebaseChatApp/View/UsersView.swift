//
//  UsersView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var vm = UsersViewModel()
    
    var body: some View {
            ScrollView{
                VStack{
                    ForEach(vm.users) { user in
                        NavigationLink(destination: {
                            ChatView(user: user)
                        }, label: {
                            UserListRowView(user: user)
                        })
                }
            }
            .navigationTitle("New message")
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
