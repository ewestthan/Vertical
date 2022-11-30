//
//  VerticalApp.swift
//  Vertical
//
//  Created by Ethan West on 10/13/22.
//

import SwiftUI
import Firebase

@main
struct VerticalApp: App {
//    @StateObject var user = User()
    @EnvironmentObject var viewModel: AuthViewModel

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
