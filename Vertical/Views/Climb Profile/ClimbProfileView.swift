//
//  ClimbProfileView.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import SwiftUI

struct ClimbProfileView: View {
    let climb: ClimbProfileModel
    
    var body: some View {
        VStack {
            ZStack {
                Image("exampleClimb")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
            }
            HStack {
                Text("\(climb.Name!) | \(climb.Grade!)")
                    .font(.title)
                    .padding(.leading)
                Spacer()
                Button(action: {
                    //Go to post form
                }) {
                    Text("Add")
                }
                    .buttonStyle(.borderedProminent)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 0)
                Spacer()
                Button(action: {
                    //Follow the climb
                }) {
                    Text("Follow")
                }
                    .buttonStyle(.borderedProminent)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 0)
                Spacer()
            }
            StarsView(rating:climb.Rating!).frame(height:18)
            Spacer()
        }.ignoresSafeArea()
        
    }
}

struct ClimbProfile_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfileView(climb: ClimbProfileModel())
    }
}
