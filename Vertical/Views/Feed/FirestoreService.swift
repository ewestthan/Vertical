//
//  Firestore.swift
//  Vertical
//
//  Created by user227908 on 11/6/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class FirebaseService: ObservableObject {

    //@Published var user: User?
    //private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
    
    private let db = Firestore.firestore()
    
    init() {
        //addListeners()
    }
    
    func fetchPosts() async throws -> [Post] {
        let snapshot = try await db.collection("posts").getDocuments()
        
        return snapshot.documents.compactMap{ document in try? document.data(as: Post.self) }
    }
    
    func fetchFollowingPosts(_ userUID: String) async throws -> [Post] {
        //CollectionReference userFollowingRef = rootRef.collection("following/" + uid + "/userFollowing");
        let refsFollowing = try await db.collection("following/\(userUID)/follows").getDocuments()
        
        let ids = refsFollowing.documents.compactMap{ document in document.documentID }
        print(ids)
        
        var posts = [Post]()
        for id in ids {
            let refsPosts = try await db.collection("posts/\(id)/posts").order(by: "date", descending: true).limit(to: 3).getDocuments()
            let recentPosts = refsPosts.documents.compactMap{ document in try? document.data(as: Post.self) }
            print(recentPosts)
            posts.append(contentsOf: recentPosts)
            
        }        
        return posts
    }
}
