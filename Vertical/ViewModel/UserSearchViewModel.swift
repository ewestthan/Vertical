//
//  UserSearchViewModel.swift
//  Vertical
//
//  Created by user227432 on 11/14/22.
//

import Combine

final class UserSearchViewModel: ObservableObject {
    @Published var userSearchRepository = SearchService()
    @Published var users: [UserInfo] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        userSearchRepository.$users
            .assign(to: \.users, on: self)
            .store(in: &cancellables)
    }
    
    func search(userName: String) {
        userSearchRepository.userSearch(userName: userName)
    }
    
}
