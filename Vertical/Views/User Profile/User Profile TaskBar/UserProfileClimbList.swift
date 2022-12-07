import SwiftUI
import SDWebImageSwiftUI

struct UserProfileClimbRow: View {
    var climb: Post
    let isExpanded: Bool
    
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
                StarsView(rating: climb.rating).frame(width:75)
                Spacer()
                Text(climb.description)
                Spacer()
                Image("arrow").resizable()
                    .scaledToFill()
                    .frame(maxWidth: 10, maxHeight: 10 )
                    .rotationEffect(Angle(degrees: 180))
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
           
            if isExpanded{
                WebImage(url: URL(string: climb.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 395, maxHeight: 440)
                    .clipped()
                VStack(alignment: .leading){
                    Text(climb.description)
                }
                .padding([.bottom], 20)
            }
        }
    }
}

struct UserProfileClimbList: View {
    
    var userPosts: [Post]
    @State private var selection: Set<Post> = []
    @EnvironmentObject var postViewModel: UserPostViewModel
    
    var body: some View{
        ScrollView {
            LazyVStack{
                ForEach(userPosts, id: \.id){ post in
                    UserProfileClimbRow(climb: post, isExpanded: self.selection.contains(post))
                        .onTapGesture{ self.selectDeselect(post)}
                        .animation(.linear(duration: 0.3))
                }
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    
    
    func selectDeselect(_ climb: Post){
        if selection.contains(climb){
            selection.remove(climb)
        }
        else{
            selection.removeAll()
            selection.insert(climb)
        }
    }
}

struct UserProfileClimbList_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileClimbList(userPosts: [Post(date: Date(timeIntervalSince1970: TimeInterval(10)), description: "Test", climbName: "test", climbLocation: "test", grade: 5, imageUrl: "No Image", ownerId: "Test", ownerImageUrl: "no Image", ownerUsername: "test", rating: 3, likes: 2)])
    }
}
