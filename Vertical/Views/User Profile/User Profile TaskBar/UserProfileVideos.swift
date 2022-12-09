//
//  UserProfileVideos.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserProfileVideo: View {
    
    var post: Post

    var body: some View {
        WebImage(url: URL(string: post.ownerImageUrl))
            .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .cornerRadius(14)
    }
}

struct UserProfileVideoPost: View {
    let climb: ClimbRow
    
    var body: some View {
        VStack{
            HStack{
                StarsView(rating: climb.stars).frame(width:75)
                Spacer()
                Text(climb.name)
                Spacer()
                Text("V" + String(climb.grade))
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956).opacity(0.5))
            Image(climb.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading){
                Text(climb.area)
                    .bold()
                Text(climb.description)
            }
            .padding([.bottom], 20)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct UserProfileVideos: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var userPosts: [Post]
    @EnvironmentObject var postViewModel: UserPostViewModel
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 7) {
            ForEach(userPosts, id: \.id){ post in
                NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post.toPostData()))){
                    UserProfileVideo(post: post)
                    Text("")
                }
            }
            
        }.frame(maxHeight: .infinity, alignment: .top)
    }
}
