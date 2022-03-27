//
//  RecentMessageRowView.swift
//  SelfFirebaseChatApp
//
//  Created by Kyungyun Lee on 27/03/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecentMessageRowView: View {
    
    let recentMessage : RecentMessageModel?
    
    var body: some View {
        HStack {
            if let url = recentMessage?.profileImageUrl {
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
                Text(recentMessage?.fullname ?? "")
                    .font(.headline)
                     .foregroundColor(.black)
                Text(recentMessage?.text ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(recentMessage?.timeAgo ?? "")
        }
        .padding(.horizontal)
    }
}
//
//struct RecentMessageRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentMessageRowView()
//    }
//}
