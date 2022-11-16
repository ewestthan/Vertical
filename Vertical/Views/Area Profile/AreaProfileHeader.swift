//
//  AreaProfileHeader.swift
//  Vertical
//
//  Created by Shawn Rodgers on 10/27/22.
//

import SwiftUI
import Foundation

struct AreaProfileHeader: View {
    
    let area: Area

    var body: some View {
        VStack {
            Image(area.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 200)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .clipped()
            HStack(spacing: 70) {
                VStack(alignment: .leading) {
                    Text("Bolton Valley")
                        .font(.system(size: 24, weight: .heavy))
                        .multilineTextAlignment(.leading)
                    Text(area.location)
                        .font(.system(size: 14, weight: .medium))
                }
                HStack {
                    VStack {
                        Text(String(area.follower_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Followers")
                            .font(.system(size: 14, weight: .regular))
                    }
                    VStack {
                        Text(String(area.boulder_count))
                            .font(.system(size: 18, weight: .heavy))
                        Text("Boulders")
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            }
            HStack(spacing: 85) {
                HStack {
                    Button(action:{
                        
                    }, label: {
                        Text("Follow")
                            .padding([.leading, .trailing], 20)
                            .padding([.bottom, .top], 10)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    })
                    Button(action:{
                        
                    }, label: {
                        Text("+")
                            .padding([.leading, .trailing], 15)
                            .padding([.bottom, .top], 10)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    })
                    Text("•••")
                }
                StarsView(rating: area.rank)
                    .frame(width: 100)
            }
        }
    }
        
}

struct AreaProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfileHeader(area: Area())
    }
}
