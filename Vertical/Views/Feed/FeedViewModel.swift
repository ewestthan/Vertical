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
    @Published var fetchedBoot = false
    
    private let fs = FirebaseService()

    @MainActor
    func loadPostsFollowing(userUID: String) async {
        if userUID.isEmpty {
            return
        }
        
        if !fetchedBoot {
            self.fetchedBoot = true
        }
        
        if UserDefaults.standard.object(forKey: "lastFeedFetch") == nil {
            
            // If first time launching set it to last week to grab a little of old posts
            UserDefaults.standard.set(Calendar.current.date(byAdding: .month, value: -1, to: Date()), forKey: "lastFeedFetch")
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
