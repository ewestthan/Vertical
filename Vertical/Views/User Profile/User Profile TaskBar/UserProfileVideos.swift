//
//  UserProfileVideos.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI
struct UserProfileVideo: View {
    
    var climb: ClimbRow

    var body: some View {
        Image(climb.image)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 120)
            .cornerRadius(14)
    }
}

struct UserProfileVideoPost: View {
    let climb: ClimbRow
    
    var body: some View {
        VStack{
            HStack{
                StarsView(rating: climb.stars).frame(width:75)
                Spacer()
                Text(climb.name)
                Spacer()
                Text("V" + String(climb.grade))
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956).opacity(0.5))
            Image(climb.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading){
                Text(climb.area)
                    .bold()
                Text(climb.description)
            }
            .padding([.bottom], 20)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct UserProfileVideos: View {
    
    private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 7) {
                ForEach(climbs, id: \.id){ climb in
                    NavigationLink(destination: FeedVideoCell().padding(.top)){
                        UserProfileVideo(climb: climb)
                    }
                }
                
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct UserProfileVideos_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileVideos()
    }
}
