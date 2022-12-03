//
//  UserProfileFilter.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct UserProfileFilter: View {
    
    @State var grade: Int = 0
    @State var sliderValue: Double = 0
    
    var body: some View {
        
        HStack{
            Text("V").padding(.bottom, 5)
            VStack{
                Button {
                    if(grade < 17){ grade += 1 }
                } label: {
                    Image("arrow")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 12, maxHeight: 12 )
                        .rotationEffect(Angle(degrees: 90))
                }
                Text(String(grade))
                    .frame(width: 20)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(5)
                
                Button {
                    if(grade > 0){ grade -= 1 }
                } label: {
                    Image("arrow").resizable()
                        .scaledToFill()
                        .frame(maxWidth: 12, maxHeight: 12 )
                        .rotationEffect(Angle(degrees: 270))
                }
            }
        }
        VStack{
            StarsView(rating: Int(sliderValue)).frame(maxHeight: 20)
            Slider(value: $sliderValue, in: 0...5, step: 1)
                .frame(maxWidth: 140)
                .accentColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
        }
    }
}

struct UserProfileFilter_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileFilter()
    }
}
