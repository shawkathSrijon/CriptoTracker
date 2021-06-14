//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 14/6/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let coinDataService = CoinDataService()
    var cancleable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] receivedCoins in
                self?.allCoins = receivedCoins
                print("All Coins: \(receivedCoins)")
            }
            .store(in: &cancleable)
    }
}
