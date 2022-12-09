//
//  ClimbProfileView.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import SwiftUI

struct ClimbProfile: View {
    
    @ObservedObject var climbVM = ClimbProfileService()
    @ObservedObject var postViewModel: ClimbPostViewModel
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
        self.postViewModel = ClimbPostViewModel()
        postViewModel.grabPosts(climbId: id)
    }
    
    init(id: String) {
        self.id = id
        self.climb = ClimbProfileModel(id: id, Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test")
        self.loadFromId = true
        self.postViewModel = ClimbPostViewModel()
        postViewModel.grabPosts(climbId: id)
    }
    
    var body: some View {
        VStack{
            ClimbProfileHeader(climb: climbVM.climb)
            ClimbProfileBottom(climbPosts: postViewModel.climbPosts)
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
        ClimbProfile(climb: ClimbProfileModel(id: "0", Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test"))
    }
}
