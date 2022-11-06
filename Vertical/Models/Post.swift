//
//  Post.swift
//  Vertical
//
//  Created by user227908 on 11/6/22.
//

import Foundation
import FirebaseFirestoreSwift

public struct Post: Hashable, Codable, Identifiable {
    @DocumentID public var id: String?
    var title: String
    var content: String
}
