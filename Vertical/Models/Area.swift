//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/1/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Area: Hashable, Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var location: String
    var image: String
    var zip: String
    var follower_count: Int
    var boulder_count: Int
    var rank: Int
    var elevation: Int
    var bio: String
    var description: String
}

