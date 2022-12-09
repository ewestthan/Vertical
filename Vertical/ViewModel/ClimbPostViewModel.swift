//
//  ClimbPostViewModel.swift
//  Vertical
//
//  Created by Ethan West on 12/9/22.
//

import Combine
import Firebase
 
final class ClimbPostViewModel: ObservableObject {
    @Published var climbPostRepository: ClimbPostService = ClimbPostService()
    @Published var climbPosts: [Post] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        climbPostRepository.$climbPosts
            .assign(to: \.climbPosts, on: self)
            .store(in: &cancellables)
    }
    
    func grabPosts(climbId: String) {
        climbPostRepository.grabPosts(userId: climbId)
        print(self.climbPosts)
    }
}
