//
//  ClimbProfileAscentsList.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//
import SwiftUI
import SDWebImageSwiftUI

struct ClimbProfileAscentRow: View {
    var post: Post
    
    var body: some View {
        HStack{
            content
        }.contentShape(Rectangle())
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(20)
            .padding([.leading, .trailing], 10)
    }

    private var content: some View{
        VStack{
            HStack{
                StarsView(rating: post.rating).frame(width:75)
                Spacer()
                Text(post.climbName)
                Spacer()
                Text(">")
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)

//                Image(post.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                VStack(alignment: .leading){
//                    Text(post.area)
//                        .bold()
//                    Text(post.description)
//                }
//                .padding([.bottom], 20)
//            }
        }
    } 
}

struct ClimbProfileAscentList: View {

    var climbPosts: [Post]
    @State private var selection: Set<Post> = []
    @EnvironmentObject var postViewModel: ClimbPostViewModel
    @StateObject private var feedVM = FeedViewModel()
    
    var body: some View{
        ScrollView {
            LazyVStack{
                ForEach(climbPosts, id: \.id){ post in
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post.toPostData())).padding(.top)){
                        ClimbProfileAscentRow(post: post)
                    }
                }
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
//
//struct ClimbProfileAscentList_Previews: PreviewProvider {
//    static var previews: some View {
//        ClimbProfileAscentList()
//    }
//}

