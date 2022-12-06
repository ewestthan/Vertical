//
//  Feed.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct Feed: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    @StateObject private var feedVM = FeedViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach(feedVM.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }.padding(.top)
            
            if feedVM.fetching {
                ProgressView()
            }
        }
        .onAppear{ Task { if !feedVM.fetchedBoot {await feedVM.loadPostsFollowing(userUID: authModel.currentUser?.id ?? "")}} }
        .refreshable {
            Task { await feedVM.loadPostsFollowing(userUID: authModel.currentUser?.id ?? "")}
        }
    }
}
