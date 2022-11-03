//
//  AreaSearch.swift
//  Vertical
//
//  Created by Ethan West on 11/2/22.
//

import SwiftUI

struct SearchAreaRowView: View {
    var area: Area
    
    var body: some View {
        HStack{
            content
        }.contentShape(Rectangle())
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(20)
    }
    
    private var content: some View{
        VStack{
            HStack{
                Image(area.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 2)
                    }
                
                VStack(alignment: .leading){
                    Text(area.name)
                        .font(.system(size: 16))
                    Text(area.location).foregroundColor(.gray).font(.system(size: 12))
                }.padding(.leading, 10)
                Spacer()
                StarsView(rating: Int(area.rank)).frame(maxHeight: 15)
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
        }
    }
}

struct AreaSearch: View {
    
    let searchText: String
    @State var searchCollection = areas
    
    var body: some View{
        scrollForEach
    }
    
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
                ForEach(areas.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id){ area in
                    NavigationLink(destination: AreaProfile())
                    { SearchAreaRowView(area: area).animation(.linear(duration: 0.3))
                    }
                }
            }
        }
    }
}

struct AreaSearch_Previews: PreviewProvider {
    static var previews: some View {
        AreaSearch(searchText: "")
    }
}

