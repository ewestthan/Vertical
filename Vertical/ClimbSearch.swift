//
//  ClimbSearch.swift
//  Vertical
//
//  Created by user227432 on 11/10/22.
//

import Firebase

class ClimbSearchService: ObservableObject {
    let firestore = Firestore.firestore()
    @Published var climbs: [ClimbProfileModel] = []
    let path = "ClimbProfile"
    
    init() {
        // Something
    }
    
    func search(climbName: String) {
        self.climbs = []
        firestore.collection(self.path).whereField("Name", isEqualTo: climbName).getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print(error)
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            try self.climbs.append(document.data(as: ClimbProfileModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
        }
    }
}
