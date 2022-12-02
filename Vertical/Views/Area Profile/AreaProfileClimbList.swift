//
//  AreaProfileClimbList.swift
//  Vertical
//
//  Created by Shawn Rodgers on 12/01/22.
//
import Foundation
import SwiftUI

struct AreaProfileClimbRow: View {
    
    var climb: AreaClimb
    var id: String
    var name: String
    var rank: Int
    
    init(climb: AreaClimb) {
        self.climb = climb
        if let id = climb.id {
            self.id = id
        }
        else {
            self.id = "-1"
        }
        if let name = climb.name {
            self.name = name
        }
        else {
            self.name = "None"
        }
        if let rank = climb.rank {
            self.rank = rank
        }
        else {
            self.rank = 0
        }
    }
    
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
                StarsView(rating: self.rank).frame(width:75)
                Spacer()
                Text(self.name)
                Spacer()
                Image("arrow").resizable()
                    .scaledToFill()
                    .frame(maxWidth: 10, maxHeight: 10 )
                    .rotationEffect(Angle(degrees: 180))
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 25.0)
        }
    }
}

struct AreaProfileClimbList: View {
    
    var climbs: [AreaClimb]
    
    init(climbs: [AreaClimb]) {
        self.climbs = climbs
    }

    var body: some View{
        LazyVStack{
            ForEach(self.climbs, id: \.id){ climb in
                AreaProfileClimbRow(climb: climb)
            }
        }.frame(maxHeight: .infinity, alignment: .top)
    }
                    
}
