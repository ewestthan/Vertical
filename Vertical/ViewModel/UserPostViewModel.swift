//
//  UserPostViewModel.swift
//  Vertical
//
//  Created by user227432 on 12/3/22.
//

import Combine
import Firebase

final class UserPostViewModel: ObservableObject {
    @Published var userPostRepository: PostService = PostService()
    @Published var userPosts: [Post] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        userPostRepository.$userPosts
            .assign(to: \.userPosts, on: self)
            .store(in: &cancellables)
    }
    
    func grabPosts(userId: String) {
        userPostRepository.grabPosts(userId: userId)
        print(self.userPosts)
    }
}

