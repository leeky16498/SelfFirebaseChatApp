//
//  ChatListViewModel.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

class UsersViewModel : ObservableObject {
    
    @Published var users : [UserModel] = []
    
    init() {
        fetchUserLists()
    }
    
    func fetchUserLists() {
        
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments { documentSnapshot, error in
                if let error = error {
                    print("Error to get user lists")
                    return
                }
                print("success")
                //success
                documentSnapshot?.documents.forEach({ snapshot in
                    guard let user = try? snapshot.data(as: UserModel.self) else {return}
                    
                    if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        self.users.append(user)
                    } // 접속한 유저를 뺀 나머지를 불러온다.
                })
            }
    }
}
