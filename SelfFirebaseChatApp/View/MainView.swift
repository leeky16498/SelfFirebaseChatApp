//
//  MainView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        TabView{
            ProfileView()
                .tabItem({
                    Image(systemName: "person.fill")
                    Text("Profile")
                })
            
            RecentMessageView()
                .tabItem({
                    Image(systemName: "bubble.right")
                    Text("Messages")
                })
            
            SettingView()
                .tabItem({
                    Image(systemName: "gear")
                    Text("Settings")
                })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
