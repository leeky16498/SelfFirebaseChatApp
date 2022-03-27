//
//  RecentMessageModel.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct RecentMessageModel : Codable, Identifiable {
    
    @DocumentID var id : String?
    let fullname, username, text, email, fromID, toID, profileImageUrl : String
    let timeStamp : Date
    
    var timeAgo : String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: timeStamp, relativeTo: Date())
    }
}
