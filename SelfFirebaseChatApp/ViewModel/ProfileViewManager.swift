//
//  ProfileViewManager.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

class ProfileViewManager : ObservableObject {
    
    @Published var currentUser : CurrentUser?
    
    init() {
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    print("error to get current user")
                }
                //success
                print("success")
                self.currentUser = try? snapshot?.data(as: CurrentUser.self)
            }
    }
    
    func signOutUser() {
        try? FirebaseManager.shared.auth.signOut()
    }
}
