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
    
    func fetchFollowingPosts(_ userUID: String) async throws -> [Post] {
        let refsFollowing = try await db.collection("following/\(userUID)/follows").getDocuments()
        
        let ids = refsFollowing.documents.compactMap{ document in document.documentID }
        print(ids)
        
        var posts = [Post]()
        for id in ids {
            //let t = try await db.collection("posts/\(id)/posts").getDocuments()
            //print(t.documents[0].data(as: Post.self))
            let refsPosts = try await db.collection("posts/\(id)/posts").order(by: "date", descending: true).limit(to: 3).getDocuments()
            let recentPosts = refsPosts.documents.compactMap{ document in try? document.data(as: Post.self) }
            print(recentPosts)
            posts.append(contentsOf: recentPosts)
            
        }        
        return posts
    }
}
