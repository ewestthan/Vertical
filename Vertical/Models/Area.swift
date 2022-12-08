//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/1/22.
//

import Foundation
import FirebaseFirestoreSwift

public struct Area: Hashable, Codable, Identifiable {
    @DocumentID public var id: String?
    var name: String?
    var isFollowed: Bool? = false
    var location: String?
    var image: String?
    var zip: String?
    var bio: String?
    var follower_count: Int?
    var boulder_count: Int?
    var rank: Int?
    var description: String?
    var elevation: Int?
    var climbs: [AreaClimb]?
    var header_image: String?
}
