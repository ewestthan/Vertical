//
//  ClimbProfile.swift
//  Vertical
//
//  Created by user227432 on 11/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct ClimbProfileModel: Hashable, Codable, Identifiable {
    @DocumentID var id: String?
    var Name: String
    var Grade: Int
    var Rating: Int
    var Area: String
    var Picture_URL: String
    var header_image: String?
}
