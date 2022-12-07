//
//  Feed.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import RefreshableScrollView

struct Feed: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    @StateObject private var feedVM = FeedViewModel()
    
    var body: some View {
        ScrollView{
            PullToRefresh(coordinateSpaceName: "Pull To Refresh") {
                Task { await feedVM.loadPostsFollowing(userUID: authModel.currentUser?.id ?? "")}
            }
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
        .coordinateSpace(name: "Pull To Refresh")
        //.refreshable {
        //    Task { await feedVM.loadPostsFollowing(userUID: authModel.currentUser?.id ?? "")}
        //}
    }
}

struct PullToRefresh: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                } else {
                    Text("")
                }
                Spacer()
            }
        }.padding(.top, -50)
    }
}
