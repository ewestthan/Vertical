//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/1/22.
//

import Foundation
<<<<<<< HEAD
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

=======
import FirebaseFirestoreSwift

public struct Area: Hashable, Codable, Identifiable {
    @DocumentID public var id: String?
    var name: String = "Uninitialized"
    var location: String = "Uninitialized"
    var image: String = "bolton"
    var zip: String = "Uninitialized"
    var bio: String = "Uninitialized"
    var follower_count: Int = 100
    var boulder_count: Int = 100
    var rank: Int = 3
    var description: String = "Uninitialized"
    var elevation: Int = 100
}

func loadAreas() -> [Area]{
    var areas: [Area] = []
    areas.append(Area())
    areas.append(Area(name: "Smugglers Notch"))
    return areas
}

var areas: [Area] = loadAreas()
>>>>>>> main
