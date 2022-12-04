//
//  ClimbsSearch.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchClimbRowView: View {
    var climb: ClimbProfileModel
    @EnvironmentObject var climbSearchViewModel: ClimbSearchViewModel
    
    var body: some View {
        HStack{
            content
        }
            .contentShape(Rectangle())
            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956, opacity: 0.8))
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding([.leading, .trailing], 10)
    }
    
    private var content: some View {
        VStack {
            HStack {
                WebImage(url: climbSearchViewModel.climbImages[climb.Picture_URL] == nil ? nil : climbSearchViewModel.climbImages[climb.Picture_URL]!)
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(climb.Name + "V" + String(climb.Grade)).font(.system(size: 16))
                    Text(climb.Area).font(.system(size: 12))
                }.padding(.leading, 10)
                Spacer()
                StarsView(rating: climb.Rating).frame(maxHeight: 15)
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
    
    }
    
}


struct ClimbSearch: View {
    
    let climbs: [ClimbProfileModel]

    var body: some View{
        scrollForEach
    }
    
    var list: some View {
        NavigationView{
            List(climbs) { climb in
                NavigationLink{
                    Text("")
                } label: {
                    SearchClimbRowView(climb: climb)
                }
            }
        }
    }
                       
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
                ForEach(climbs){ climb in
                    NavigationLink(destination: ClimbProfile(climb: climb)){ SearchClimbRowView(climb: climb).animation(.linear(duration: 0.3))
                            .frame(maxHeight: 60)
                    }
                }
            }
        }
    }
}

struct ClimbSearch_Previews: PreviewProvider {
    static var previews: some View {
        ClimbSearch(climbs: [ClimbProfileModel(Name: "Example", Grade: 3, Rating: 4, Area: "Example Area", Picture_URL: "Something")])
    }
}
