//
//  ClimbProfileModel.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import Foundation
import SwiftUI

struct ClimbProfileData: Hashable, Codable {
    var name: String
    var grade: Int
    var rating: Int
    var area: String
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
}
