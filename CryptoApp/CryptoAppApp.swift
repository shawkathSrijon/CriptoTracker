//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Simec Sys Ltd. on 13/6/21.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    @ObservedObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
