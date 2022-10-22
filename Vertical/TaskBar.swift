//
//  TaskBar.swift
//  Vertical
//
//  Created by Ethan West on 10/18/22.
//

import Foundation
import SwiftUI

struct TaskBar: View {
    var body: some View {
        TabView{
            UserProfile()
                .tabItem{(Image(systemName: "house"))
                    Text("Profile")
                }
            Feed()
                .tabItem{(Image(systemName: "house"))
                Text("Home")

                }
        }
    }
}
