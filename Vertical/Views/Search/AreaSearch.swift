//
//  AreaSearch.swift
//  Vertical
//
//  Created by Ethan West on 11/2/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchAreaRowView: View {
    var area: Area
    var image: String
    var name: String
    var location: String
    var rank: Int
    @EnvironmentObject var areaSearchViewModel: AreaSearchViewModel
    
    init(area: Area) {
        self.area = area
        if let image = area.image {
            self.image = image
        }
        else {
            self.image = "smuggs"
        }
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
        if let rank = area.rank {
            self.rank = rank
        }
        else {
            self.rank = 5
        }
    }
    
    var body: some View {
        HStack{
            content
        }.contentShape(Rectangle())
            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956, opacity: 0.8))
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding([.leading, .trailing], 10)
    }
    
    private var content: some View{
        VStack{
            HStack{
                WebImage(url: areaSearchViewModel.areaImages[self.image] == nil ? nil : areaSearchViewModel.areaImages[self.image]!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text(self.name).font(.system(size: 16))
                    Text(self.location).font(.system(size: 12))
                }.padding(.leading, 10)
                Spacer()
                StarsView(rating: Int(self.rank)).frame(maxHeight: 15)
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
    }
}

struct AreaSearch: View {
    
    let areas: [Area]
    
    var body: some View{
        scrollForEach
    }
    
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
                ForEach(areas) { area in
                    NavigationLink(destination: AreaProfile(area: area)) {
                        SearchAreaRowView(area: area).animation(.linear(duration: 0.3)).frame(maxHeight: 60)
                    }
                }
            }
        }
    }
}

struct AreaSearch_Previews: PreviewProvider {
    static var previews: some View {
        AreaSearch(areas: [])
    }
}

