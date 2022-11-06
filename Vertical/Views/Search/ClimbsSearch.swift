//
//  ClimbsSearch.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct SearchClimbRowView: View {
    let climb: ClimbProfileModel
    
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
                //TODO: Still need to figure out how to store images
                Image("exampleClimb")
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    
                Spacer()
                Text(climb.Name!)
                Spacer()
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
        }
    }
}

struct ClimbSearch: View {
    
    let searchText: String
    @ObservedObject var climbProfileListViewModel: ClimbProfileListViewModel = ClimbProfileListViewModel()
    
    
    var body: some View{
        scrollForEach
    }
    
    var list: some View {
        NavigationView{
                List(climbProfileListViewModel.climbProfiles.filter({ searchText.isEmpty ? true : $0.Name!.contains(searchText)}), id: \.id) { climb in
                    NavigationLink(destination:
                        SearchClimbRowView(climb: climb)) {
                        ClimbProfileView(climb: climb)
                    }
                }
        }
    }
                       
    var scrollForEach: some View {
            NavigationView {
                List {
                    ForEach(climbProfileListViewModel.climbProfiles.filter({ searchText.isEmpty ? true : $0.Name!.contains(searchText)}), id: \.id){ climb in
                        NavigationLink(destination:
                                        ClimbProfileView(climb: climb)) {
                            SearchClimbRowView(climb: climb)
                                .modifier(ListRowModifier())
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
        ClimbSearch(searchText: "", climbProfileListViewModel: ClimbProfileListViewModel())
    }
}
