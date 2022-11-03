//
//  ClimbProfileModel.swift
//  Vertical
//
//  Created by user227432 on 10/25/22.
//

import FirebaseFirestoreSwift

struct ClimbProfileModel: Identifiable, Codable {
    @DocumentID var id: String?
    var Name: String?
    var Grade: String?
    var Rating: Int?
}
