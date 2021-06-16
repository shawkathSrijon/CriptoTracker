//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 16/6/21.
//

import SwiftUI

struct CoinImageView: View {
    @ObservedObject var coinImageViewModel: CoinImageViewModel
    
    init(coin: CoinModel) {
        _coinImageViewModel = ObservedObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = coinImageViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if coinImageViewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondarText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinImageView(coin: dev.coin)
                .padding()
                .previewLayout(.sizeThatFits)
            CoinImageView(coin: dev.coin)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
