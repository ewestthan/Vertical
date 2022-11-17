//
//  User.swift
//  Vertical
//
//  Created by user227908 on 11/1/22.
//

import SwiftUI
import FirebaseFirestoreSwift

class User: ObservableObject {
    @Published var isAuthenticated = false
    
    @Published var email = ""
    @Published var name = ""
    
    @Published var uid = ""
    
}

struct UserInfo: Hashable, Codable, Identifiable {
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
}
