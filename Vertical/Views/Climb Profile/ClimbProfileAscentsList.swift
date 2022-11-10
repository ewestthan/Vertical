////
////  ClimbProfileAscentsList.swift
////  Vertical
////
////  Created by Ethan West on 11/10/22.
////
//import Foundation
//import SwiftUI
//
//struct AscentRow: Hashable, Codable {
//    var id: Int
//    var name: String
//    var grade: Int
//    var stars: Int
//    var area: String
//    var image: String
//    var description: String
//}
//
//struct ClimbProfileAscentRow: View {
//    var climb: AscentRow
//    let isExpanded: Bool
//
//    var body: some View {
//        HStack{
//            content
//        }.contentShape(Rectangle())
//            .background(.white)
//            .foregroundColor(.black)
//            .cornerRadius(20)
//            .padding([.leading, .trailing], 10)
//    }
//
//    private var content: some View{
//        VStack{
//            HStack{
//                StarsView(rating: climb.stars).frame(width:75)
//                Spacer()
//                Text(climb.name)
//                Spacer()
//                Text(">")
//            }
//            .padding([.top, .bottom], 10)
//            .padding([.leading, .trailing], 25.0)
//
//            if isExpanded{
//                Image(climb.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                VStack(alignment: .leading){
//                    Text(climb.area)
//                        .bold()
//                    Text(climb.description)
//                }
//                .padding([.bottom], 20)
//            }
//        }
//    }
//}
//
//struct ClimbProfileAscentList: View {
//
//    @State private var selection: Set<AscentRow> = []
//
//    var body: some View{
//        LazyVStack{
//            ForEach(users, id: \.id){ user in
//                ClimbProfileAscentRow(user: user, isExpanded: self.selection.contains(user))
//                    .onTapGesture{ self.selectDeselect(user)}
//                    .animation(.linear(duration: 0.3))
//            }
//        }.frame(maxHeight: .infinity, alignment: .top)
//    }
//
//
//    func selectDeselect(_ climb: AscentRow){
//        if selection.contains(climb){
//            selection.remove(climb)
//        }
//        else{
//            selection.removeAll()
//            selection.insert(climb)
//        }
//    }
//}
//
//struct ClimbProfileAscentList_Previews: PreviewProvider {
//    static var previews: some View {
//        ClimbProfileAscentList()
//    }
//}
//
