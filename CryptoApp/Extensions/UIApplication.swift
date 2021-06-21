//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Md Shawkath Hossain on 21/6/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
