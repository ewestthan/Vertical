//
//  ClimbProfileViewModel.swift
//  Vertical
//
//  Created by user227432 on 11/3/22.
//

import Combine

final class ClimbProfileListViewModel: ObservableObject {
    @Published var climbProfileRepository = ClimbProfileRepository()
    @Published var climbProfiles: [ClimbProfileModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        climbProfileRepository.$climbProfiles
            .assign(to: \.climbProfiles, on: self)
            .store(in: &cancellables)
    }
    
    func get() {
        climbProfileRepository.get()
    }
}
