//
//  AreaProfileHeader.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/27/22.
//

import SwiftUI
import Foundation
import SDWebImageSwiftUI

struct AreaProfileHeader: View {
    
    @State private var unfollowConfirm: Bool = false
    @ObservedObject private var areaVM = AreaViewModel(area: Area())
    
    let area: Area
    var name: String
    var location: String
    var image: String
    var follower_count: Int
    var boulder_count: Int
    var rank: Int
    
    init(area: Area) {
        
        self.area = area
        
        if let name = area.name {
            self.name = name
        }
        else {
            self.name = "None"
        }
        
        if let location = area.location {
            self.location = location
        }
        else {
            self.location = "None"
        }
        
        if let image = area.header_image {
            self.image = image
        }
        else {
            self.image = "https://firebasestorage.googleapis.com/v0/b/climbing-app-a374f.appspot.com/o/area_images%2Fsmugglers_notch.jpeg?alt=media&token=8f571ed2-83a3-4889-b145-3e8580f8ad3f"
        }
        
        if let follower_count = area.follower_count {
            self.follower_count = follower_count
        }
        else {
            self.follower_count = 0
        }
        
        if let boulder_count = area.boulder_count {
            self.boulder_count = boulder_count
        }
        else {
            self.boulder_count = 0
        }
        
        if let rank = area.rank {
            self.rank = rank
        }
        else {
            self.rank = 0
        }
        
    }
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: self.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 200)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .clipped()
            
            HStack{
                VStack(alignment: .leading) {
                    Text(self.name)
                        .font(.system(size: 20, weight: .heavy))
                    Text(self.location)
                        .font(.system(size: 14, weight: .medium))
                }
                .frame(width: 240, alignment: .leading)
                HStack {
                    VStack {
                        Text(String(self.follower_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Followers")
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack {
                        Text(String(self.boulder_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Boulders")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            }
            HStack(spacing: 0) {
                HStack(alignment: .center) {
                    AreaActionButtonView(viewModel: areaVM)
//                    .confirmationDialog(
//                        "Unfollow this area?",
//                        isPresented: $unfollowConfirm,
//                        titleVisibility: .visible
//                    ) {
//                        Button("Yes", role: .destructive, action: {
//                            isFollowing = false
//                        })
//                    }
                    NavigationLink(destination: VideoPostForm(tabIndex: .constant(3), grade: 0, sliderValue: 0.0, name: "", area: "")) {
                        Text("+")
                            .padding([.leading, .trailing], 15)
                            .padding([.bottom, .top], 10)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    Text("•••")
                }
                .frame(width: 280, alignment: .leading)
                StarsView(rating: self.rank)
                    .frame(width: 100)
            }
        }
    }
        
}

struct AreaProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfileHeader(area: Area())
            .environmentObject(AreaSearchViewModel())
    }
}
