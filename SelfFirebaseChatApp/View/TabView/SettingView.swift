//
//  SettingView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    Text("settings view")
                }
            }
            
            navigationTitle("Settings")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
