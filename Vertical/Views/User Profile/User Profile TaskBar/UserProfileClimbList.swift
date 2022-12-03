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

struct UserProfileGradeRow: View {
    var grade: Int
    
    var body: some View {
        HStack{
            Text(String(grade)).font(.system(size: 20)).fontWeight(.bold)
        }.contentShape(Rectangle())
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 5)
            .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding([.leading, .trailing], 10)
    }
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
            .padding([.leading, .trailing], 10)
    }
    
    private var content: some View{
        VStack{
            HStack{
                StarsView(rating: climb.stars).frame(width:75)
                    .frame(maxWidth: 75, alignment: .leading)
                Text(climb.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image("arrow").resizable()
                    .scaledToFill()
                    .frame(maxWidth: 10, maxHeight: 10, alignment: .trailing )
                    .rotationEffect(Angle(degrees: 180))
                
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
           
            if isExpanded{
                VStack(alignment: .leading){
                    Image(climb.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading){
                        Text(climb.area)
                            .bold()
                        Text(climb.description)
                    }
                    .padding([.bottom], 20)
                    .padding(.leading, 20)
                }
            }
        }
    }
}

struct UserProfileClimbList: View {
    
    @State private var selection: Set<ClimbRow> = []
//    @StateObject var viewModel = UserProfileClimbListViewModel()
    @State var currentGrade: Int = 11

    var body: some View{
        ScrollView{
            LazyVStack{
                UserProfileGradeRow(grade: currentGrade)
                ForEach(climbs.filter{ $0.grade == currentGrade}, id: \.id){ c in
                    UserProfileClimbRow(climb: c, isExpanded: self.selection.contains(c))
                        .onTapGesture{ self.selectDeselect(c)}
                        .animation(.linear(duration: 0.3))
                }
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    func selectDeselect(_ climb: ClimbRow){
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
        UserProfileClimbList()
    }
}
