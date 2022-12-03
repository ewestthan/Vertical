//
//  Firestore.swift
//  Vertical
//
//  Created by Arthur on 11/6/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FirebaseService: ObservableObject {

//    @StateObject private var postsStore = PostStore()
    
    //@Published var user: User?
    //private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
    
    private let db = Firestore.firestore()
    
    init() {
        //addListeners()
    }
    
    func fetchUserInfo(_ userUID: String) async throws -> User {
        let ref = try await db.collection("users").document(userUID).getDocument()
        return try ref.data(as: User.self)
    }
    
    func fetchAreaInfo(_ areaID: String) async throws -> Area {
        let ref = try await db.collection("areas").document(areaID).getDocument()
        return try ref.data(as: Area.self)
    }
    
    func fetchFollowingPosts(_ userUID: String) async throws -> [PostData] {
        let refsFollowing = try await db.collection("following/\(userUID)/follows").getDocuments()
        
        let lastFetched: Date = UserDefaults.standard.object(forKey: "lastFeedFetch") as! Date
//        print(lastFetched)
                
        let timestampLastFetched = Timestamp(date: lastFetched)
        
        var ids = refsFollowing.documents.compactMap{ document in document.documentID }
        ids.append(userUID)
                
        var posts = Set<PostData>() //[PostData]()
        let loadedPosts = await PostStore.load()
        
        for p in loadedPosts {
            posts.insert(p)
        }
        
        print("Loaded Posts: ", posts.count)
        
        
        for id in ids {
            let refsPosts = try await db.collection("posts/\(id)/posts").whereField("date", isGreaterThan: timestampLastFetched).order(by: "date", descending: true).limit(to: 20).getDocuments()
            let recentPosts = refsPosts.documents.compactMap{ document in try? document.data(as: Post.self) }
            
            for p in recentPosts {
                posts.insert(p.toPostData())
            }
            
//            posts.insert(recentPosts.map{ p in p.toPostData() })
            
        }
        
        PostStore.save(posts: Array(posts)) { result in
            if case .failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
        
        UserDefaults.standard.set(Date.now, forKey: "lastFeedFetch")
        
        return Array(posts)
    }
}
