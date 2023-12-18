//
//  CategoryDetailView.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 19.12.23.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: String
    @EnvironmentObject var viewModel: MainViewModel
    let gridLayout = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            UserHeader()
            details
            CartCard()
        }
    }
    var details: some View {
        ScrollView{
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.products.filter { $0.category == category }) { product in
                    ProductCard(product: product)
                }
            }
        }
    }
}
