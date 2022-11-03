//
//  ClimbProfileRepository.swift
//  Vertical
//
//  Created by user227432 on 11/3/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class ClimbProfileRepository: ObservableObject {
    private let path = "ClimbProfile"
    private let store = Firestore.firestore()
    @Published var climbProfiles: [ClimbProfileModel] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.climbProfiles = snapshot?.documents.compactMap {
                try? $0.data(as: ClimbProfileModel.self)
            } ?? []
        }
    }
}
