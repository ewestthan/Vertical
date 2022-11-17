//
//  SearchViewModel.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI

class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        fetchUsers()
    }
    func fetchUsers(){
        COLLECTION_USERS.getDocuments{ snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.users = documents.compactMap({ try? $0.data(as: User.self)})
        }
    }
}
