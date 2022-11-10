//
//  ClimbProfileHeader.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI

struct ClimbProfileHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("exampleClimb")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 200)
                .shadow(color: .black, radius: 2, x: 0, y: 0)
                .clipped()
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 5){
                    Text("Shark Fin").font(.system(size: 32))
                        .foregroundColor(.black).fontWeight(.bold).offset(y: 5)
                    HStack{
                        Text("V3").font(.system(size: 14))
                        Text("Bolton VT").font(.system(size: 14)).foregroundColor(.gray)
                    }
                    StarsView(rating: 5).frame(width: 100)
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
        ClimbProfileHeader()
    }
}
