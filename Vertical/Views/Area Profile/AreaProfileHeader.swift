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
            HStack {
                Image(users[0].image)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .shadow(radius: 7)
                VStack {
                    Text(area.name)
                        .font(.system(size: 28, weight: .heavy))
                    Text(area.location)
                        .font(.system(size: 18, weight: .medium))
                }
                VStack {
                    Text(String(area.follower_count))
                    Text("Followers")
                }
                VStack {
                    Text(String(area.boulder_count))
                    Text("Boulders")
                }
            }
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
                Text("...")
                Text("\(String(area.rank)) Stars")
            }
        }
    }
        
}

struct AreaProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfileHeader(area: areas[0])
    }
}
