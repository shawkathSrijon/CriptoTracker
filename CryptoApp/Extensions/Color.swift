//
//  Color.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 13/6/21.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondarText = Color("SecondaryTextColor")
}
