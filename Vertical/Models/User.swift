//
//  User.swift
//  Vertical
//
//  Created by user227908 on 11/1/22.
//

<<<<<<< HEAD
import SwiftUI
=======
>>>>>>> main
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    let location: String
    let description: String
    let followers: Int
    let following: Int
    let ascents: Int
    
    @DocumentID var id: String?
}

<<<<<<< HEAD
struct UserInfo: Hashable, Codable, Identifiable {
    @DocumentID var id: String?
=======
//class User: ObservableObject {
//    @Published var isAuthenticated = false
//    
//    @Published var email = ""
//    @Published var name = ""
//    
//    @Published var uid = ""
//    
//}

struct UserInfo: Hashable, Codable {
>>>>>>> main
    var email: String
    var username: String
    var fullname: String
    var profileImageUrl: String
    var location: String
    var description: String
    var followers: Int
    var following: Int
    var ascents: Int
}
