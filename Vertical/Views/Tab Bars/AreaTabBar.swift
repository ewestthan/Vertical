//
//  AreaTabBar.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/9/22.
//

import Foundation
import SwiftUI

enum AreaTab: String, CaseIterable {
    case Climbs
    case Map
    case Weather
    case Info
}

struct AreaTabBar: View {
    @Binding var selectedTab: AreaTab
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(AreaTab.allCases, id: \.rawValue) {tab in
                    Text(tab.rawValue)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                        .padding(10)
                        .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956).opacity(selectedTab == tab ? 1.0 : 0))
                        .foregroundColor(tab == selectedTab ? .white : .black)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct AreaTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AreaTabBar(selectedTab: .constant(.Climbs))
    }
}


