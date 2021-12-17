//
//  GameDetailNetworkManager.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 03/11/21.
//

import Foundation
import Combine

class GameDetailDataService {
    @Published var gameDetail: GameDetail?
    let constant = ConstantApi()
    var gameDetailSubs: AnyCancellable?
    let id: Int
    init(id: Int) {
        self.id = id
        donwloadDetailGame()
    }
    func donwloadDetailGame() {
        guard let url = URL(string: constant.detailBaseURL + "/\(id)?" +  constant.apiKey) else { return }
        print(url)
        gameDetailSubs = NetworkingManager.download(url: url)
            .decode(type: GameDetail.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] returnGameDetail in
                    self?.gameDetail = returnGameDetail
                    self?.gameDetailSubs?.cancel()
                })
    }
}
