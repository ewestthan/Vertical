//
//  UserProfileClimbList.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//
import Foundation
import SwiftUI

struct ClimbRow: Hashable, Codable {
    var id: Int
    var name: String
    var grade: Int
    var stars: Int
    var area: String
    var image: String
    var description: String
}

struct UserProfileClimbRow: View {
    var climb: ClimbRow
    let isExpanded: Bool
    
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
                StarsView(rating: climb.stars).frame(width:75)
                Spacer()
                Text(climb.name)
                Spacer()
                Text(">")
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
           
            if isExpanded{
                Image(climb.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text(climb.area)
                        .bold()
                    Text(climb.description)
                }
                .padding([.bottom], 20)
            }
        }
    }
}

struct UserProfileClimbList: View {
    
    @State private var selection: Set<ClimbRow> = []

    var body: some View{
        scrollForEach
    }
                       
    var scrollForEach: some View {
        ScrollView{
            ForEach(climbs, id: \.id){ climb in
                UserProfileClimbRow(climb: climb, isExpanded: self.selection.contains(climb))
                    .onTapGesture{ self.selectDeselect(climb)}
                    .animation(.linear(duration: 0.3))
            }
        }
    }
    func selectDeselect(_ climb: ClimbRow){
        if selection.contains(climb){
            selection.remove(climb)
        }
        else{
            selection.insert(climb)
        }
    }
}

struct UserProfileClimbList_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileClimbList()
    }
}
