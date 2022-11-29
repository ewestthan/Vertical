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
    
    private let store = FirebaseService()
    
    func loadArea(id: String) async {
        do {
            self.area = try await store.fetchAreaInfo(id)
        } catch {
            print(error)
        }
    }
    
    
}