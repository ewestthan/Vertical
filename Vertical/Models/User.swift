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
    
}
