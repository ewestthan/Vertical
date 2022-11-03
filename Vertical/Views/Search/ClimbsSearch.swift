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
            HStack{
                Image(climb.image)
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    
                Spacer()
                Text(climb.name)
                Spacer()
                Text(">")
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
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
            ForEach(climbs.filter({ searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id){ climb in
                SearchClimbRowView(climb: climb)
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

struct ClimbSearch_Previews: PreviewProvider {
    static var previews: some View {
        ClimbSearch(searchText: "")
    }
}
