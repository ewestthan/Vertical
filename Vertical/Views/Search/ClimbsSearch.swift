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
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(20)
    }
    
    private var content: some View{
        VStack{
            HStack(alignment: .center){
                Image(climb.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 2)
                    }
                    
                VStack(alignment: .leading){
                    Text(climb.name + " V" + String(climb.grade)).font(.system(size: 16))
                    Text(climb.area).font(.system(size: 12))
                        .foregroundColor(.gray)
                }.padding(.leading, 10)
                Spacer()
                StarsView(rating: climb.stars).frame(maxHeight: 15)
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
        }
    }
}

struct ClimbSearch: View {
    
    let searchText: String
    @State var searchCollection = climbs
    @State var clicked = false
    var body: some View{
        scrollForEach
    }
    
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
                ForEach(climbs.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id){ climb in
                    
                    NavigationLink(destination: ClimbProfile())
                                   { SearchClimbRowView(climb: climb).modifier(ListRowModifier())
                                            .animation(.linear(duration: 0.3))
                    }
                }
            }
        }
    }
    
    struct ListRowModifier: ViewModifier{
        func body(content: Content) -> some View {
            Group{
                content
                Divider()
            }
        }
    }
}

struct ClimbSearch_Previews: PreviewProvider {
    static var previews: some View {
        ClimbSearch(searchText: "")
    }
}
