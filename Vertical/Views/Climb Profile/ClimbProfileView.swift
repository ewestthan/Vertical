//
//  ClimbProfileView.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import SwiftUI

struct ClimbProfile: View {
    
    @ObservedObject var climbVM = ClimbProfileService()
    var climb: ClimbProfileModel
    var id: String
    var loadFromId: Bool
    
    init(climb: ClimbProfileModel) {
        self.climb = climb
        if let id = climb.id {
            self.id = id
        }
        else {
            self.id = "-1"
        }
        
        self.loadFromId = false
    }
    
    init(id: String) {
        self.id = id
        self.climb = ClimbProfileModel(Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test")
        self.loadFromId = true
    }
    
    var body: some View {
        VStack{
            ClimbProfileHeader(climb: climbVM.climb)
            ClimbProfileBottom()
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear { Task {
            do {
                if self.loadFromId {
                    try await climbVM.loadClimbFromId(self.id)
                }
                else {
                    climbVM.setClimb(climb: self.climb)
                }
            }
        }}
    }
}

struct ClimbProfile_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfile(climb: ClimbProfileModel(Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test"))
    }
}
