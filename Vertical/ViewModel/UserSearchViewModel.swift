//
//  UserSearchViewModel.swift
//  Vertical
//
//  Created by user227432 on 11/14/22.
//

import Combine
import Firebase

final class UserSearchViewModel: ObservableObject {
    @Published var userSearchRepository = SearchService()
    @Published var users: [UserInfo] = []
    @Published var userImages: [String: URL?] = [:]
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        userSearchRepository.$users
            .assign(to: \.users, on: self)
            .store(in: &cancellables)
        
        userSearchRepository.$userImages
            .assign(to: \.userImages, on: self)
            .store(in: &cancellables)
        
    }
    
    func search(userName: String) {
        userSearchRepository.userSearch(userName: userName)
    }
    
}
