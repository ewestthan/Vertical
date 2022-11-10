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
            HStack(spacing: 40) {
                HStack {
                    Image(area.image)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(radius: 7)
                    VStack {
                        Text(area.name)
                            .font(.system(size: 26, weight: .heavy))
                            .frame(width: .infinity, alignment: .leading)
                        Text(area.location)
                            .font(.system(size: 14, weight: .medium))
                    }
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
            HStack(spacing: 70) {
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
