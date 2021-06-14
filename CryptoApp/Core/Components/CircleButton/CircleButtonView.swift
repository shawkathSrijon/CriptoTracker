//
//  CircleButtonView.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 13/6/21.
//

import SwiftUI

struct CircleButtonView: View {
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(icon: "info")
                .previewLayout(.sizeThatFits)
            CircleButtonView(icon: "plus")
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }
    }
}
