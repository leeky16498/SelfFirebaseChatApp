//
//  MainMessageViewModel.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import SDWebImageSwiftUI

class RecentMessageViewModel : ObservableObject {
    
    @Published var recentMessages : [RecentMessageModel] = []
    
    init() {
        fetchRecentMessages()
        print(recentMessages)
    }
    
    func fetchRecentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {return}
        
        FirebaseManager.shared.firestore
            .collection("recentMessages")
            .document(uid)
            .collection("messages")
            .addSnapshotListener { querySnapShot, error in
                if let error = error {
                    print("error to get data")
                    return
                }
                
                querySnapShot?.documentChanges.forEach({ change in
                    let docID = change.document.documentID
                    
                    if let index = self.recentMessages.firstIndex(where: { rm in
                        return rm.id == docID
                    }) {
                        self.recentMessages.remove(at: index)
                    }
                    guard let resentMessage = try? change.document.data(as: RecentMessageModel.self) else {return}
                    
                    self.recentMessages.insert(resentMessage, at: 0)
//                    self.recentMessages.append(resentMessage)
                })
            }
    }
}
