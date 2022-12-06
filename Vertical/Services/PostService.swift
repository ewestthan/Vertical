//
//  PostService.swift
//  Vertical
//
//  Created by user227432 on 12/3/22.
//
import Firebase
import FirebaseStorage

class PostService: ObservableObject {
    let firestore = Firestore.firestore()
    let storage = Storage.storage()
    @Published var userPosts: [Post] = []
    let postPath: String = "posts"

    
    func grabPosts(userId: String) {
        self.userPosts = []
        firestore.collection(self.postPath).whereField("ownerId", isEqualTo: userId).getDocuments() {
            (querySnapshot, error) in
            if let error = error {
                print(error)
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let post: Post = try document.data(as: Post.self)
                        self.userPosts.append(post)
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
