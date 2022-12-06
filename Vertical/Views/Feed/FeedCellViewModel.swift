//
//  FeedCellViewModel.swift
//  Vertical
//
//  Created by Arthur Dolimier on 12/3/22.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    
    @Published var post: PostData
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes)"
    }
    
    init(post: PostData) {
        self.post = post
        checkIfUserLikedPost()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.currentUser?.id else { return }
                
        COLLECTION_POSTS.document(uid).collection("posts").document(self.post.id).collection("likes")
            .document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("likes")
                    .document(self.post.id).setData([:]) { _ in
                        
                        COLLECTION_POSTS.document(uid).collection("posts").document(self.post.id).updateData(["likes": self.post.likes + 1])
                        
                        self.post.didLike = true
                        self.post.likes += 1
                    }
        }
    }
    
    func unlike() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }

        COLLECTION_POSTS.document(uid).collection("posts").document(self.post.id).collection("likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("likes").document(self.post.id).delete{ _ in
                COLLECTION_POSTS.document(uid).collection("posts").document(self.post.id).updateData(["likes": self.post.likes - 1])
                
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).collection("likes").document(self.post.id)
            .getDocument { snapshot, _ in
                guard let didLike = snapshot?.exists else { return }
                self.post.didLike = didLike
                
            }
    }
    
}
