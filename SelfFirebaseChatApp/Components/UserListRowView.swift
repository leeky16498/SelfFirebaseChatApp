//
//  UserListRowView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserListRowView: View {
    
    let user : CurrentUser?
    
    var body: some View {
        HStack {
            if let url = user?.profileImageUrl {
                WebImage(url: URL(string: url))
                    .resizable()
                    .scaledToFill()
                    .frame(width : 50, height : 50)
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 3)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width : 50, height : 50)
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .stroke(.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 3)
            }
            
            VStack(alignment:. leading, spacing: 5) {
                Text(user?.fullname ?? "")
                    .font(.headline)
                    .foregroundColor(.black)
                Text(user?.username ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
//
//struct UserListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListRowView()
//    }
//}
