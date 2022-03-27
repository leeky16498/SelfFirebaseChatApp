//
//  ProfileView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @StateObject var vm = ProfileViewManager()
    @State var isActionSheet : Bool = false
    @EnvironmentObject var am : AuthViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        if let profileImageUrl = vm.currentUser?.profileImageUrl {
                            WebImage(url: URL(string: profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .font(.body)
                                .frame(width : 60, height : 60)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                )
                                .padding()
                            
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .font(.body)
                                .frame(width : 60, height : 60)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(.gray, lineWidth: 1)
                                )
                                .padding()
                        }
                       
                        VStack(alignment: .leading){
                            Text(vm.currentUser?.fullname ?? "")
                                .font(.title2.bold())
                            Text(vm.currentUser?.username ?? "")
                            Text(vm.currentUser?.email ?? "")
                                .font(.footnote)
                                .padding(.top, -1)
                        }
                        Spacer()
                    }//hst
                    .onLongPressGesture(perform: {
                        self.isActionSheet.toggle()
                    })
                    .actionSheet(isPresented: $isActionSheet, content: {
                        .init(title: Text("Settings"), message: Text("What do you want?"), buttons: [.destructive(Text("Sign out"), action: {
                            vm.signOutUser()
                        }), .cancel()])
                    })
                    .frame(maxWidth : .infinity)
                    .frame(height : 90)
                    .background(.ultraThinMaterial)
                }//vst
            }
            .navigationTitle("User Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        UsersView()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
