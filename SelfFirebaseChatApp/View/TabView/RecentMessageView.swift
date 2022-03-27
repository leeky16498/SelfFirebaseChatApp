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
