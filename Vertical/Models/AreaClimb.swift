//
//  AreaProfile.swift
//  Vertical
//
//  Created by Shawn Rodgers on 12/1/22.
//

import Foundation
import FirebaseFirestoreSwift

public struct AreaClimb: Hashable, Codable, Identifiable {
    @DocumentID public var id: String?
    var name: String?
    var rank: Int?
}
