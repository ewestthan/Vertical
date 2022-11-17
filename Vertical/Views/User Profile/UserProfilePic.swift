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
        AsyncImage(url: URL(string: pic)) { image in
                image
                    .resizable()
                    .scaledToFill()
        } placeholder: {
            Color.gray
        }
            .frame(width: 115, height: 115)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 6)
            }
    }
}

struct UserProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePic(pic: "test Image")
    }
}
