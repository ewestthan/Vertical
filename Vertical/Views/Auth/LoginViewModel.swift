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
    
//    @Published var email = "admin@vertical.com"
//    @Published var password = "vertical"
//    
//    @Published var isSignedIn = false
//    @Published var errorMessage = ""
//    @Published var loading = false
//    
//    private var cancellable: AnyCancellable?
//    
//    private let fs = FirebaseService()
//    
//    // Gets updated when view is loaded, since cannot pass environmental object directly
//    @Published var localUser = User()
//    
//    init() {
//        //self.localUser = user
//        
//        self.cancellable = Publishers.CombineLatest($email, $password)
//            .map { $0.isEmpty && $1.isEmpty }
//            .sink {empty in
//                if !empty {
//                    self.errorMessage = ""
//                }
//            }
//    }
//    
//    @MainActor
//    func login() async {
//        self.loading = true
//        do {
//            print("Signin in...")
//            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
//            let userFire = authResult.user
//            
//            print("User signed in as \(userFire.email ?? "")")
//            self.isSignedIn = true
//            self.loading = false
//            
//            self.localUser.isAuthenticated = true
//            self.localUser.uid = userFire.uid
//            
//            let userInfo = try await self.fs.fetchUserInfo(userFire.uid)
//            
//            self.localUser.email = userInfo.email
//            self.localUser.name = userInfo.name
//
//            
//        } catch {
//            print(error)
//        }
//    }
    
}
