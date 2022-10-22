//
//  UserProfilePic.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfilePic: View {
    var body: some View {
        Image("ProfilePic")
            .resizable()
            .frame(width: 125, height: 125)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct UserProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePic()
    }
}
