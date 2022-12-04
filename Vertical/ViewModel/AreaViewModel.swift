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
    
    @Published var area: Area
    
    init(area: Area) {
        self.area = area
    }
    
    private let store = FirebaseService()
    
    func loadArea(id: String) async {
        do {
            self.area = try await store.fetchAreaInfo(id)
            self.area.climbs = try await store.fetchAreaClimbs(id)
        } catch {
            print(error)
        }
    }
    
    func setArea(area: Area) async {
        self.area = area
        self.area.climbs = await loadAreaClimbs(area: area)
    }
    
    func loadAreaClimbs(area: Area) async -> [AreaClimb] {
        var climbs = [AreaClimb]()
        do {
            if let id = area.id {
                climbs = try await store.fetchAreaClimbs(id)
            }
        }
        catch {
            print(error)
        }
        return climbs
    }
    
    
    
    
    
    
}
