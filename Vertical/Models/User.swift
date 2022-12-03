//
//  User.swift
//  Vertical
//
//  Created by user227908 on 11/1/22.
//
import SwiftUI
import FirebaseFirestoreSwift

//struct User: Identifiable, Decodable{
//    let username: String
//    let email: String
//    let profileImageUrl: String
//    let fullname: String
//    let location: String
//    let description: String
//    let followers: Int
//    let following: Int
//    let ascents: Int
//
//    @DocumentID var id: String?
//}

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    var email: String
    var username: String
    var fullname: String
    var profileImageUrl: String
    var location: String
    var description: String
    var followers: Int
    var following: Int
    var ascents: Int
    var isCurrentUser: Bool {return AuthViewModel.shared.userSession?.uid == id}
    var isFollowed: Bool? = false
}
