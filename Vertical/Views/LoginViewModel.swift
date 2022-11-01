//
//  SwiftUIViewModel.swift
//  Vertical
//
//  Created by user227908 on 11/1/22.
//

import SwiftUI
import Firebase
import FirebaseAuthCombineSwift
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = "admin@vertical.com"
    @Published var password = "vertical"
    
    @Published var isSignedIn = false
    @Published var errorMessage = ""
    @Published var loading = false
    
    private var cancellable: AnyCancellable?
    
    @Published var localUser = User()
    
    init() {
        //self.localUser = user
        
        self.cancellable = Publishers.CombineLatest($email, $password)
            .map { $0.isEmpty && $1.isEmpty }
            .sink {empty in
                if !empty {
                    self.errorMessage = ""
                }
            }
    }
    
    @MainActor
    func login() async {
        self.loading = true
        print("Hello")
        do {
            print("Signin in...")
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            let userFire = authResult.user
            
            print("User signed in as \(userFire.email ?? "")")
            self.isSignedIn = true
            self.loading = false
            
            self.localUser.isAuthenticated = true
            self.localUser.email = userFire.email ?? ""
            
        } catch {
            print(error)
        }
    }
    
}
