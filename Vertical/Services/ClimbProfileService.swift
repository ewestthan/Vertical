//
//  ClimbProfileService.swift
//  Vertical
//
//  Created by Shawn Rodgers on 12/6/22.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class ClimbProfileService: ObservableObject {
    
    @Published var climb = ClimbProfileModel(id: "0", Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test")
    
    func setClimb(climb: ClimbProfileModel) {
        self.climb = climb
    }
    
    func loadClimbFromId(_ climbID: String) async throws {
        let ref = try await Firestore.firestore().collection("ClimbProfile").document(climbID).getDocument()
        self.climb = try ref.data(as: ClimbProfileModel.self)
    }
    
}
