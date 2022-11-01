//
//  UserSearch.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI

struct UserRow: Hashable, Codable {
    var id: Int
    var name: String
    var handle: String
    var location: String
    var image: String
    var description: String
    var followers: Int
    var following: Int
    var ascents: Int
    
    struct Climbs: Hashable, Codable {
        var id: Int
        var name: String
        var grade: Int
        var stars: Int
        var area: String
        var image: String
        var description: String
    }
}

struct SearchUserRow: View {
    var user: UserRow
    
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
                Image(user.image)
                    .resizable()
                    .scaledToFill()
//                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    
                Spacer()
                Text(user.handle)
                Spacer()
                Text(">")
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
        }
    }
}

struct UserSearch: View {
    
    let searchText: String
    @State var searchCollection = users
    
    var body: some View{
        scrollForEach
    }
    
    var list: some View {
        NavigationView{
            List(users.filter({ searchText.isEmpty ? true : $0.handle.contains(searchText)}), id: \.id) { user in
                NavigationLink(destination: UserProfile(user: user)){
                    SearchUserRow(user: user)
                }
            }
        }
    }
                       
    var scrollForEach: some View {
        ScrollView{
            ForEach(users.filter({ searchText.isEmpty ? true : $0.handle.contains(searchText)}), id: \.id){ user in
                SearchUserRow(user: user)
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

struct UserSearch_Previews: PreviewProvider {
    static var previews: some View {
        UserSearch(searchText: "")
    }
}
