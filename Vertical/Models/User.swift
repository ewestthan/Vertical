//
//  User.swift
//  Vertical
//
//  Created by user227908 on 11/1/22.
//

import SwiftUI

class User: ObservableObject {
    @Published var isAuthenticated = false
    
    @Published var email = ""
    @Published var name = ""
    
    @Published var uid = ""
    
}

struct UserInfo: Hashable, Codable {
    var email: String
    var name: String
}
