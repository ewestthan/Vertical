//
//  FeedViewModel.swift
//  Vertical
//
//  Created by user227908 on 11/6/22.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var fetching = false
    @Published var posts = [Post]()
    
    private let fs = FirebaseService()

    
    @MainActor
    func loadPostsFollowing(userUID: String) async {
        do {
            self.fetching = true
            self.posts = try await fs.fetchFollowingPosts(userUID)
            self.fetching = false
        } catch {
            print(error)
        }
        
    }
    
    
}
