//
//  AreaViewModel.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/26/22.
//

import Foundation
import SwiftUI
import Combine

class AreaViewModel: ObservableObject {
    
    @Published var area: Area = Area()
    @Published public var id: String = "Ngyru3cnP0fjmnOzL5CY"
    
    private let store = FirebaseService()
    
    func loadArea() async {
        do {
            self.area = try await store.fetchAreaInfo(self.id)
        } catch {
            print(error)
        }
    }
    
    
}
