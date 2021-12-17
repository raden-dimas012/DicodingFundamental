//
//  GameViewModel.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 07/10/21.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var games: [Game] = []
    let dataService = GameDataService.instance
    var cancellables = Set<AnyCancellable>()

    init() {
        addSubsribers()
    }
    func addSubsribers() {
        dataService.$gameModels
            .sink { [weak self] (returnedGameModels) in
                self?.games = returnedGameModels
            }
            .store(in: &cancellables)
    }
}
