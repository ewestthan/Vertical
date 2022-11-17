//
//  User.swift
//  Vertical
//
//  Created by user227908 on 11/1/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
}

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
    var email: String
    var name: String
}
