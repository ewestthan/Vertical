//
//  Post.swift
//  Vertical
//
//  Created by user227908 on 11/6/22.
//

import Foundation
import FirebaseFirestoreSwift

public struct Post: Codable, Identifiable {
    @DocumentID public var id: String?
    var date: Date
    var description: String
    var climbName: String
    var climbLocation: String
    var grade: Int
    var imageUrl: String
    var ownerId: String
    var ownerImageUrl: String
    var ownerUsername: String
    var rating: Int
    var likes: Int
    
    func getFormattedDate() -> String {
        return self.date.formatted(.dateTime)
    }
    
    func toPostData() -> PostData {
        return PostData(id: id!, date: date, description: description, climbName: climbName, climbLocation: climbLocation, grade: grade, imageUrl: imageUrl, ownerId: ownerId, ownerImageUrl: ownerImageUrl, ownerUsername: ownerUsername, rating: rating, likes: likes)
    }
    
}

// Have to translate Post to PostData to encode to json
public struct PostData: Codable, Identifiable, Hashable {
    public var id: String
    var date: Date
    var description: String
    var climbName: String
    var climbLocation: String
    var grade: Int
    var imageUrl: String
    var ownerId: String
    var ownerImageUrl: String
    var ownerUsername: String
    var rating: Int
    var likes: Int
    var didLike: Bool? = false
    
    func getFormattedDate() -> String {
        return self.date.formatted(.dateTime)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: PostData, rhs: PostData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func toPost() -> Post {
        return Post(id: id, date: date, description: description, climbName: climbName, climbLocation: climbLocation, grade: grade, imageUrl: imageUrl, ownerId: ownerId, ownerImageUrl: ownerImageUrl, ownerUsername: ownerUsername, rating: rating, likes: likes)
    }
    
}

