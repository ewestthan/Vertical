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
    @EnvironmentObject var climbSearchViewModel: ClimbSearchViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WebImage(url: climbSearchViewModel.climbImages[climb.Picture_URL] == nil ? nil : climbSearchViewModel.climbImages[climb.Picture_URL]!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 200)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .clipped()
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 5){
                    Text(climb.Name).font(.system(size: 32))
                        .foregroundColor(.black).fontWeight(.bold).offset(y: 5)
                    HStack{
                        Text(climb.Grade).font(.system(size: 14))
                        Text(climb.Area).font(.system(size: 14)).foregroundColor(.gray)
                    }
                    StarsView(rating: climb.Rating).frame(width: 100)
                }.padding(.leading)
                    .padding(.top, 10)
                
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
                    Button(action:{
                    }, label: {
                        Text("Add")
                            .frame(maxWidth: 120, maxHeight: 35)
                            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .fontWeight(.bold)
                    })
                }.padding([.trailing, .top])
            }
        }
    }
}

struct ClimbProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ClimbProfileHeader(climb: ClimbProfileModel(Name: "test", Grade: "V4", Rating: 4, Area: "Test", Picture_URL: "Test"))
    }
}
