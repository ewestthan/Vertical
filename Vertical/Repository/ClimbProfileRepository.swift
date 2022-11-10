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
        store.collection(path).getDocuments { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            for document in snapshot!.documents {
                do {
                    let tempDocument = try document.data(as: ClimbProfileModel.self)
                    self.climbProfiles.append(tempDocument)
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
