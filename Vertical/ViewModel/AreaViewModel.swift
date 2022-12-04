//
//  AreaViewModel.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/26/22.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class AreaViewModel: ObservableObject {
    
    @Published var area: Area
    @Published var areaClimbs: [AreaClimb]
    
    private var db = Firestore.firestore()
    
    init(area: Area) {
        self.area = area
        self.areaClimbs = [AreaClimb]()
    }
    
    func loadArea(id: String) async {
        do {
            self.area = try await fetchAreaInfo(id)
            fetchAreaClimbs(id)
            self.area.climbs = self.areaClimbs
        } catch {
            print(error)
        }
    }
    
    func setArea(area: Area) {
        self.area = area
        if let id = area.id {
            fetchAreaClimbs(id)
        }
        self.area.climbs = self.areaClimbs
    }
    
    func fetchAreaInfo(_ areaID: String) async throws -> Area {
        let ref = try await db.collection("areas").document(areaID).getDocument()
        return try ref.data(as: Area.self)
    }
    
    func fetchAreaClimbs(_ areaID: String) {
        db.collection("test_climbs").getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("no climbs")
                return
            }
            self.areaClimbs = documents.map { (queryDocumentSnapshot) -> AreaClimb in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? "None"
                let name = data["name"] as? String ?? "None"
                let rank = data["rank"] as? Int ?? 0
                return AreaClimb(id: id, name: name, rank: rank)
            }
        }
    }
    
}
