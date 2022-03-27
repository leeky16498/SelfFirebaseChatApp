//
//  FirebaseManager.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import Foundation
import Firebase

class FirebaseManager : ObservableObject {
    
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let firestore = Firestore.firestore()
    let storage = Storage.storage()
    
}
