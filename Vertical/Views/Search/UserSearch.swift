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
    var user: User
    
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
//                Image(user.image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 35, height: 35)
//                    .clipShape(Circle())

                VStack(alignment: .leading){
                    Text(user.username).font(.system(size: 16))
//                    Text(user.location).font(.system(size: 12))
                }.padding(.leading, 10)
                Spacer()
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
    }
}

struct UserSearch: View {
    
    let searchText: String
    @State var searchCollection = users
    @ObservedObject var viewModel: SearchViewModel

    var body: some View{
        scrollForEach
    }
                       
    var scrollForEach: some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.users.filter({ searchText.isEmpty ? true : $0.username.contains(searchText)}), id: \.id){ user in
                    NavigationLink(
                        destination: Text("")){
                        SearchUserRow(user: user).animation(.linear(duration: 0.3))
                            .frame(maxHeight: 60)
                    }
                }
            }
        }
    }
}

struct UserSearch_Previews: PreviewProvider {
    static var previews: some View {
        UserSearch(searchText: "", viewModel: SearchViewModel())
    }
}
