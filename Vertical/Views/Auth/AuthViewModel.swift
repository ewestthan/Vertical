//
//  AuthViewModel.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI
import Firebase
class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
    }
    
    func login(){
        print("login")
        
    }
    
    func register(withEmail email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user...")
        }
        
    }
    
    func resetPassword(){
        
    }
    func signout(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        
    }
}
