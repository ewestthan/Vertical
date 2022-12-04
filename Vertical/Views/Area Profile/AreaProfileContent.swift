//
//  AreaProfileContent.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/9/22.
//

import Foundation
import SwiftUI

struct AreaProfileContent: View {
    
    @State private var tabSelected: AreaTab = .Climbs
    var area: Area
    var weather: String
    var bio: String
    var description: String
    var climbs: [AreaClimb]
    
    init(area: Area) {
        
        self.area = area
        
        if let name = area.name {
            self.weather = "Weather in \(name): \n 34 degrees"
        }
        else {
            self.weather = "Unable to load weather"
        }
        
        if let bio = area.bio {
            self.bio = bio
        }
        else {
            self.bio = "None"
        }
        
        if let description = area.description {
            self.description = description
        }
        else {
            self.description = "None"
        }
        
        if let climbs = area.climbs {
            self.climbs = climbs
        }
        else {
            self.climbs = [AreaClimb]()
        }
        
    }
    
    var body: some View {
        VStack {
            Text(self.bio)
                .padding(20)
                .frame(width: .infinity)
                .multilineTextAlignment(.center)
            Divider()
            AreaTabBar(selectedTab: $tabSelected)
            TabView(selection: $tabSelected) {
                ForEach(AreaTab.allCases, id: \.rawValue) { tab in
                    HStack {
                        if (tab.rawValue == "Climbs") {
                            if self.climbs.count > 0 {
                                AreaProfileClimbList(climbs: self.climbs)
                                    .padding()
                            }
                            else {
                                Text("No climbs in this area")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        }
                        if (tab.rawValue == "Map") {
                            MapView()
                        }
                        if (tab.rawValue == "Weather") {
                            Text(self.weather).multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                        if (tab.rawValue == "Info") {
                            Text(self.description)
                                .padding(40)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        }
                    }
                    .tag(tab)
                }
                .background(Color(.gray).opacity(0.2))
            }
        }
        .padding([.top], 10)
        .background(Color(.gray).opacity(0.2))
    }
    
}

struct AreaProfileContent_Previews: PreviewProvider {
    static var previews: some View {
        AreaProfileContent(area: Area())
    }
}
