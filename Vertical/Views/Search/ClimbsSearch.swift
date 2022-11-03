//
//  ClimbsSearch.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct SearchClimbRowView: View {
    var climb: ClimbRow
    
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
                Image(climb.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    
                VStack(alignment: .leading){
                    Text(climb.name + " V" + String(climb.grade)).font(.system(size: 16))
                    Text(climb.area).font(.system(size: 12))
                }.padding(.leading, 10)
                Spacer()
                StarsView(rating: climb.stars).frame(maxHeight: 15)
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
    }
}

struct ClimbSearch: View {
    
    let searchText: String
    @State var searchCollection = climbs

    var body: some View{
        scrollForEach
    }
    
    var list: some View {
        NavigationView{
            List(climbs.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id) { climb in
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
                ForEach(climbs.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id){ climb in
                    
                    NavigationLink(destination: ClimbProfile()){ SearchClimbRowView(climb: climb).animation(.linear(duration: 0.3))
                            .frame(maxHeight: 60)
                    }
                }
            }
        }
    }
}

struct ClimbSearch_Previews: PreviewProvider {
    static var previews: some View {
        ClimbSearch(searchText: "")
    }
}
