//
//  SelfFirebaseChatAppApp.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import SwiftUI
import Firebase

@main
struct SelfFirebaseChatAppApp: App {
    
    @StateObject var vm = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
