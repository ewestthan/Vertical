//
//  VerticalApp.swift
//  Vertical
//
//  Created by Ethan West on 10/13/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

@main
struct VerticalApp: App {
//    @StateObject var user = User()
    @EnvironmentObject var viewModel: AuthViewModel

    init() {
        FirebaseApp.configure()
        
        let cache = SDImageCache(namespace: "images")
        cache.config.maxMemoryCost  = 100 * 1024 * 1024
        cache.config.maxDiskSize = 100 * 1024 * 1024
        SDImageCachesManager.shared.addCache(cache)
        SDWebImageManager.defaultImageCache = SDImageCachesManager.shared
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(AuthViewModel.shared)
//                .onAppear(perform: { UserDefaults.standard.set(Date.now, forKey: "lastOpened") })
        }
    }
}
