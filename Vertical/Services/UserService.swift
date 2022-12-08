//
//  UserService.swift
//  Vertical
//
//  Created by Ethan West on 12/3/22.
//

import Firebase

struct UserService {
    static func follow(uid: String, completion: ((Error?) -> Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_FOLLOWING.document(currentUid).collection("follows").document(uid).setData([:]) { _ in
            COLLECTION_FOLLOWING.document(uid).collection("followed").document(currentUid).setData([:], completion: completion)
        }
    }
    static func unfollow(uid: String, completion: ((Error?) -> Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_FOLLOWING.document(currentUid).collection("follows").document(uid).delete { _ in
            COLLECTION_FOLLOWING.document(uid).collection("followed").document(currentUid).delete(completion: completion)
        }
    }
    
    static func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_FOLLOWING.document(currentUid).collection("follows").document(uid).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else {return }
            completion(isFollowed)
        }
    }
}
