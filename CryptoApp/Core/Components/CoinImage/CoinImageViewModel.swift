//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 16/6/21.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading: Bool = true
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    
    var cancleable = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubscriber()
    }
    
    private func addSubscriber() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancleable)
    }
}
