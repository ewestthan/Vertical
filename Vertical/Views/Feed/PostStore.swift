//
//  PostStore.swift
//  Vertical
//
//  Created by Arthur Dolimier on 12/3/22.
//

import Foundation

class PostStore: ObservableObject {
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("posts.data")
    }
    
    static func load() async -> [PostData] {
//        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
//                    DispatchQueue.main.async {
//                        completion(.success([]))
//                    }
                    return []
                }
                let posts = try JSONDecoder().decode([PostData].self, from: file.availableData)
                return posts
//                DispatchQueue.main.async {
//                    completion(.success(posts))
//                }
            } catch {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
            }
//        }
        
        return []
    }
    
    static func save(posts: [PostData], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(posts)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(posts.count))
                    print("Saved \(posts.count)")
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    
}
