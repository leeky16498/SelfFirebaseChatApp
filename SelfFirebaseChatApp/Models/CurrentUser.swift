//
//  UserModel.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 26/03/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct CurrentUser : Identifiable, Codable {
    @DocumentID var id : String?
    let uid, email, profileImageUrl, fullname, username : String
}
