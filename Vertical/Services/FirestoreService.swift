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
    
    private let db = Firestore.firestore()
    
    init() {
        
    }
    
    func fetchUserInfo(_ userUID: String) async throws -> User {
        let ref = try await db.collection("users").document(userUID).getDocument()
        return try ref.data(as: User.self)
    }
    
    func fetchFollowingPosts(_ userUID: String) async throws -> [PostData] {
    
        let refsFollowing = try await db.collection("following/\(userUID)/follows").getDocuments()
        
        var lastFetched: Date = UserDefaults.standard.object(forKey: "lastFeedFetch") as! Date
                
        let timestampLastFetched = Timestamp(date: lastFetched)
        
        var ids = refsFollowing.documents.compactMap{ document in document.documentID }
        ids.append(userUID)
                
        var postsDict: [String : PostData] = [:]
        let loadedPosts = await PostStore.load()
        
        for p in loadedPosts {
            postsDict[p.id] = p
        }
                
        var newPosts = false
        for id in ids {
            let refsPosts = try await COLLECTION_POSTS.whereField("ownerId", isEqualTo: id).whereField("date", isGreaterThan: timestampLastFetched).order(by: "date", descending: true).limit(to: 20).getDocuments()
            
            let recentPosts = refsPosts.documents.compactMap{ document in try? document.data(as: Post.self) }
            
            for p in recentPosts {
                postsDict[p.id ?? ""] = p.toPostData()
            }
                        
            if recentPosts.count > 0 {
                newPosts = true
            }
        }
                
        for (id, post) in postsDict {
            var ref = try await COLLECTION_POSTS.document(id).getDocument()
            if let p = try? ref.data(as: Post.self) {
                postsDict.updateValue(p.toPostData(), forKey: id)
            }
            
        }
                
        if newPosts {
            print("Saving...")
            PostStore.save(posts: Array(postsDict.values)) { result in
                if case .failure(let error) = result {
                    fatalError(error.localizedDescription)
                }
            }
            print("Saved")
        }
        
        UserDefaults.standard.set(Date.now, forKey: "lastFeedFetch")
        
        return Array(postsDict.values.sorted{ $0.date > $1.date })
    }
}
