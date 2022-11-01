//
//  ClimbProfileView.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import SwiftUI

struct ClimbProfile: View {
    var body: some View {
        VStack {
            ZStack {
                Image("exampleClimb")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                ZStack {
                    Rectangle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 80, height: 30)
                    Button(action: {}) {
                        Label("Back", systemImage: "chevron.left")
                    }
                }
                    .padding(.bottom, 340.0)
                    .padding(.trailing, 320)
            }
            HStack {
                Text("Shark Fin | V3")
                    .font(.title)
                    .padding(.leading)
                Spacer()
                Button(action: {}) {
                    Text("Add")
                }
                    .buttonStyle(.borderedProminent)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 0)
                Spacer()
                Button(action: {}) {
                    Text("Follow")
                }
                    .buttonStyle(.borderedProminent)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: 0)
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct ClimbProfile_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfile()
    }
}
