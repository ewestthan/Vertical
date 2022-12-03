//
//  FeedViewModel.swift
//  Vertical
//
//  Created by user227908 on 11/6/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var fetching = false
    @Published var posts = [PostData]()
    @Published var lastRefreshed = Date.now
    
    private let fs = FirebaseService()

    @MainActor
    func loadPostsFollowing(userUID: String) async {
        if userUID.isEmpty {
            return
        }
        
        if UserDefaults.standard.object(forKey: "lastFeedFetch") == nil {
            
            // If first time launching set it to last week to grab a little of old posts
            UserDefaults.standard.set(Date.today().previous(.monday), forKey: "lastFeedFetch")
        }
        
        do {
            self.fetching = true
            self.posts = try await fs.fetchFollowingPosts(userUID)
            self.fetching = false
        } catch {
            print(error)
        }
        
        
        
        
        
    }
    
    
}
