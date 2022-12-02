//
//  AreaSearchViewModel.swift
//  Vertical
//
//  Created by user227432 on 11/28/22.
//

import Combine
import Firebase

final class AreaSearchViewModel: ObservableObject {
    @Published var areaSearchRepository = SearchService()
    @Published var areas: [Area] = []
    @Published var areaImages: [String: URL?] = [:]
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        areaSearchRepository.$areas
            .assign(to: \.areas, on: self)
            .store(in: &cancellables)
        
        areaSearchRepository.$areaImages
            .assign(to: \.areaImages, on: self)
            .store(in: &cancellables)
        
    }
    
    func search(areaName: String) {
        areaSearchRepository.areaSearch(areaName: areaName)
    }
    
}
