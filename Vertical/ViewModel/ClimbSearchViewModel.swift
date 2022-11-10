//
//  ClimbSearchViewModel.swift
//  Vertical
//
//  Created by user227432 on 11/10/22.
//

import Combine

final class ClimbSearchViewModel: ObservableObject {
    @Published var climbSearchRepository = ClimbSearchService()
    @Published var climbs: [ClimbProfileModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        climbSearchRepository.$climbs
            .assign(to: \.climbs, on: self)
            .store(in: &cancellables)
    }
    
    func search(climbName: String) {
        climbSearchRepository.search(climbName: climbName)
    }
}
