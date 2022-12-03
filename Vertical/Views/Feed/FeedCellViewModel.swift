//
//  FeedCellViewModel.swift
//  Vertical
//
//  Created by Arthur Dolimier on 12/3/22.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    
    @Published var post: PostData
    
    init(post: PostData) {
        self.post = post
    }
    
    func like() {
        
    }
    
    func unlike() {
        
    }
    
    func checkIfUserLikedPost() {
        
    }
    
}
