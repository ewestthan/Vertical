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
    
    func fetchData() {
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("Areas").document(id)
        
    }
    
    var body: some View {
        VStack{
            AreaProfileHeader(area: areas[0])
        }
    }
    
}

struct AreaProfile_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfile(id: "nyeaiKZxDTg81GS1GYWV")
    }
}
