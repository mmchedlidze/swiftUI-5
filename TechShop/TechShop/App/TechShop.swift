//
//  TechShop.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

@main
struct shopify: App {
    @StateObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
