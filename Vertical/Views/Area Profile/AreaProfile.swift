//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/25/22.
//

import SwiftUI
import Firebase

struct AreaProfile: View {
    
    let id: String
    var data: Area
    
    init(id: String) {
        self.id = id
        self.data = Area()
        fetchData()
    }
    
    func fetchData() {
        let db = Firestore.firestore()
        let docRef = db.collection("Areas").document(id)
        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    let _ = print(data)
                }
            }
            
        }
    }
    
    var body: some View {
        VStack{
            AreaProfileHeader(area: self.data)
        }
    }
    
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfile(id: "nyeaiKZxDTg81GS1GYWV")
    }
}
