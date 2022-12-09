//
//  ClimbPostService.swift
//  Vertical
//
//  Created by Ethan West on 12/9/22.
//

import Firebase
import FirebaseStorage

class ClimbPostService: ObservableObject {
    let firestore = Firestore.firestore()
    let storage = Storage.storage()
    @Published var climbPosts: [Post] = []
    let postPath: String = "posts"

    
    func grabPosts(userId: String) {
        self.climbPosts = []
        firestore.collection(self.postPath).whereField("climbId", isEqualTo: userId).getDocuments() {
            (querySnapshot, error) in
            if let error = error {
                print(error)
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let post: Post = try document.data(as: Post.self)
                        self.climbPosts.append(post)
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
