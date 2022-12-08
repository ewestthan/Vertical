//
//  AreaService.swift
//  Vertical
//
//  Created by Ethan West on 12/6/22.
//

import Foundation

struct AreaService {
    static func follow(aid: String, completion: @escaping(Bool) -> Void){
        print("DEBUG: In Area Service")
        print(aid)
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        print("DEBUG: Following Area")
        print(currentUid)
        COLLECTION_FOLLOWING.document(currentUid).collection("followsArea").document(aid).setData([:]) { err in
            if let err = err {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    static func unfollow(aid: String, completion: @escaping(Bool) -> Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        print("DEBUG: unfollowing area")
        COLLECTION_FOLLOWING.document(currentUid).collection("followsArea").document(aid).delete() { err in
            if let err = err {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    static func checkIfUserIsFollowed(aid: String, completion: @escaping(Bool) -> Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_FOLLOWING.document(currentUid).collection("followsArea").document(aid).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else {return }
            completion(isFollowed)
        }
    }
}
