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
    @Published var climb: ClimbProfileModel

    let AREAS_COLLECTION = Firestore.firestore().collection("areas")
    
    init(area: Area) {
        self.area = area
        self.areaClimbs = [AreaClimb(id: "EBSczr1BNlIimiAXUNT5", name: "Primate", rank: 5), AreaClimb(id: "cr50dO13IAczdhosJGQZ", name: "The Masochist", rank: 3), AreaClimb(id: "WU1KgVjqpaljL8ei1DVK", name: "Pac Man", rank: 5), AreaClimb(id: "W9nb7XnZt0ontEAV9rFi", name: "The Impossible Problem", rank: 3)]
        //self.areaClimbs = [AreaClimb]()
        self.climb = ClimbProfileModel(Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test")
    }
    
    func loadClimbFromId(_ climbID: String) async throws {
        let ref = try await Firestore.firestore().collection("ClimbProfile").document(climbID).getDocument()
        self.climb = try ref.data(as: ClimbProfileModel.self)
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
        let ref = try await Firestore.firestore().collection("areas").document(areaID).getDocument()
        return try ref.data(as: Area.self)
    }
    
    func fetchAreaClimbs(_ areaID: String) {
        AREAS_COLLECTION.document(areaID).collection("climbs").getDocuments { (querySnapshot, error) in
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
