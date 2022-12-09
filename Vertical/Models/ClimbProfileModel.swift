//
//  ClimbProfileModel.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct ClimbProfileData: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var name: String
    var grade: Int
    var rating: Int
    var area: String
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
}
