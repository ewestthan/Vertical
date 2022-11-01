//
//  Feed.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import Foundation
import SwiftUI

struct Feed: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach(0 ..< 10){ _ in
                    FeedVideoCell()
                    
                }
            }.padding(.top)
        }
        
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
