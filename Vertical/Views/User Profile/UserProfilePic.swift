//
//  UserProfilePic.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import SwiftUI

struct UserProfilePic: View {
    var pic: String
    
    var body: some View {
        Image(pic)
            .resizable()
            .scaledToFill()
            .frame(width: 115, height: 115)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 6)
            }
    }
}

struct UserProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePic(pic: users[0].image)
    }
}
