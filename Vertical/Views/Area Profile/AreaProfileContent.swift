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
    
    var body: some View {
        VStack {
            Text(self.area.description)
                .padding()
                .frame(width: .infinity)
                .multilineTextAlignment(.center)
            Divider()
            AreaTabBar(selectedTab: $tabSelected)
            TabView(selection: $tabSelected) {
                ForEach(AreaTab.allCases, id: \.rawValue) { tab in
                    HStack {
                        if (tab.rawValue == "Climbs") {
                            UserProfileClimbList()
                                .padding()
                        }
                        if (tab.rawValue == "Map") {
                            Text("Map")
                        }
                        if (tab.rawValue == "Weather") {
                            Text("Weather")
                        }
                        if (tab.rawValue == "Info") {
                            Text("Located just 30 minutes from downtown Burlington, Bolton has some of the most extensive options for climbing in the Green Mountain State. ")
                                .padding(40)
                                .multilineTextAlignment(.center)
                                .frame(maxHeight: .infinity, alignment: .top)
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
