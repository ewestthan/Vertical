//
//  ClimbSearchViewModel.swift
//  Vertical
//
//  Created by user227432 on 11/10/22.
//

import Combine
import Firebase

final class ClimbSearchViewModel: ObservableObject {
    @Published var climbSearchRepository = SearchService()
    @Published var climbs: [ClimbProfileModel] = []
    @Published var climbImages: [String: URL?] = [:]
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        climbSearchRepository.$climbs
            .assign(to: \.climbs, on: self)
            .store(in: &cancellables)
        
        climbSearchRepository.$climbImages
            .assign(to: \.climbImages, on:self)
            .store(in: &cancellables)
    }
    
    func search(climbName: String) {
        climbSearchRepository.climbSearch(climbName: climbName)
    }
    
    func resetCache() {
        climbSearchRepository.clearClimbCache()
    }
}
