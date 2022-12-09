//
//  UploadPostViewModel.swift
//  Vertical
//
//  Created by Ethan West on 11/17/22.
//

import Firebase
import SwiftUI

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(description: String, grade: Int, rating: Int, date: Date, image: UIImage, name: String, area: String, id: String, completion: ((Error?) -> Void)?) async{
        guard let user = AuthViewModel.shared.currentUser else {
            print("DEBUG: no Current user")
            return
        }
        
        await ImageUploader.uploadImage(image: image, type: .post){imageUrl in
            let data = [
                        "climbLocation": area,
                        "climbName": name,
                        "description": description,
                        "date": date,
                        "likes": 0,
                        "rating": rating,
                        "grade": grade,
                        "imageUrl": imageUrl,
                        "ownerId": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUsername": user.username] as [String : Any]
            
            
            //guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
            
            COLLECTION_POSTS.addDocument(data: data) { _ in
                print("DEBUG: Uploaded Post to user profile")
            }
            
//            Firestore.firestore().collection("ClimbProfile").document(id).collection("posts").addDocument(data: data) { _ in
//                print("DEBUG: Uploaded Post to climb profile")
//            }
         }
    }
}
