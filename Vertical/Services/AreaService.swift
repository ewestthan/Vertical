//
//  AreaService.swift
//  Vertical
//
//  Created by Ethan West on 12/6/22.
//

import Foundation

struct AreaService {
    static func follow(aid: String, completion: ((Error?) -> Void)?){
        print("DEBUG: In Area Service")
        print(aid)
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        print("DEBUG: Following Area")
        print(currentUid)
        COLLECTION_FOLLOWING.document(currentUid).collection("followsArea").document(aid).setData([:])
    }
    static func unfollow(aid: String, completion: ((Error?) -> Void)?){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        print("DEBUG: unfollowing area")
        COLLECTION_FOLLOWING.document(currentUid).collection("followsArea").document(aid).delete()
    }
    
    static func checkIfUserIsFollowed(aid: String, completion: @escaping(Bool) -> Void){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_FOLLOWING.document(currentUid).collection("followsArea").document(aid).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else {return }
            completion(isFollowed)
        }
    }
}
