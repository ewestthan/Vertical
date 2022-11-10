//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 11/1/22.
//

import Foundation

struct Area: Hashable, Codable, Identifiable {
    var id: String = "-1"
    var name: String = "Bolton"
    var location: String = "Vermont, USA"
    var zip: String = "00000"
    var image: String = "bolton"
    var follower_count: Int = 100
    var boulder_count: Int = 100
    var rank: Int = 3
    var description: String = "Bolton, VT is a great place to climb! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis sapien sodales."
}

var areas: [Area] = load("Areas.json")
