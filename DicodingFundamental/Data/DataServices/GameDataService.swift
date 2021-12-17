//
//  GameNetworkManager.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 01/11/21.
//

import Foundation
import Combine

class GameDataService {
    static let instance = GameDataService()
    @Published var gameModels: [Game] = []
    let constant = ConstantApi()
    var cancellables = Set<AnyCancellable>()
    var gameDataSubs: AnyCancellable?
    private init() {
        downloadDataGame()
    }
    func downloadDataGame() {
        guard let url = URL(string: constant.baseURL + constant.apiKey + constant.page) else { return }
        gameDataSubs = NetworkingManager.download(url: url)
            .decode(type: Result.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion
                  , receiveValue: { [weak self] (returnGame) in
                self?.gameModels = returnGame.results
                self?.gameDataSubs?.cancel()
            })

    }

}
