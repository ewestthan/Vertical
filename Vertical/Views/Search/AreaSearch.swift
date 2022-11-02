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
//                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    
                Spacer()
                VStack(alignment: .leading){
                    Text(area.name)
                    Text(area.location).foregroundColor(.gray)
                }
                Spacer()
                Text(">")
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
    
    var list: some View {
        NavigationView{
            List(areas.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id) { area in
                NavigationLink{
                    TestClimbSearch(name: area.name)
                } label: {
                    SearchAreaRowView(area: area)
                }
            }
        }
    }
                       
    var scrollForEach: some View {
        ScrollView{
            ForEach(areas.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id){ area in
                SearchAreaRowView(area: area)
                    .modifier(ListRowModifier())
                    .animation(.linear(duration: 0.3))
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

struct AreaSearch_Previews: PreviewProvider {
    static var previews: some View {
        AreaSearch(searchText: "")
    }
}

