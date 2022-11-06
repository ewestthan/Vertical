//
//  Feed.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import Foundation
import SwiftUI

struct Feed: View {
    
    @EnvironmentObject var user: User
    @StateObject private var feedVM = FeedViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach(feedVM.posts) { post in
                    Text(post.title).font(.title3)
                    Text(post.content).font(.caption)
                    //FeedVideoCell()
                    
                }
            }.padding(.top)
            
            if feedVM.fetching {
                ProgressView()
            }
        }.onAppear{ Task { await feedVM.loadPostsFollowing(userUID: user.uid)} }
        
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
