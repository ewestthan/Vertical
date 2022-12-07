//
//  ClimbProfileHeader.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ClimbProfileHeader: View {
    var climb: ClimbProfileModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let url = climb.header_image {
                WebImage(url: URL(string: url))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                    .clipped()
            }
            else {
                WebImage(url: URL(string: ""))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                    .clipped()
            }
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 5){
                    Text(climb.Name).font(.system(size: 32))
                        .foregroundColor(.black).fontWeight(.bold).offset(y: 5)
                    HStack{
                        Text("V" + String(climb.Grade)).font(.system(size: 14))
                        Text(climb.Area).font(.system(size: 14)).foregroundColor(.gray)
                    }
                    StarsView(rating: climb.Rating).frame(width: 100)
                }
                
                Spacer()
                VStack{
                    Button(action:{
                    }, label: {
                        Text("Follow")
                            .frame(maxWidth: 120, maxHeight: 35)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    })
                    NavigationLink(destination:
                                    VideoPostForm(tabIndex: .constant(3), grade: Int(exactly: climb.Grade)!, sliderValue: Double(climb.Rating), name: climb.Name, area: climb.Area))
                                   {
                        Text("Add")
                            .frame(maxWidth: 120, maxHeight: 35)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .fontWeight(.bold)
                        
                    }
                }
                .padding(.top, 5)
            }
            .padding(15)
        }
    }
}

struct ClimbProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfileHeader(climb: ClimbProfileModel(Name: "test", Grade: 4, Rating: 4, Area: "Test", Picture_URL: "Test"))
    }
}
