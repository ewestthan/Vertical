//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/1/22.
//

import Foundation

struct Area: Hashable, Codable {
    var id: Int
    var name: String
    var location: String
    var image: String
    var follower_count: Int
    var boulder_count: Int
    var rank: Float
    var description: String
}

var areas: [Area] = load("Areas.json")
