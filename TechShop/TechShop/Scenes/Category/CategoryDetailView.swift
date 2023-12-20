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
    @Binding var path: NavigationPath

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
    private var details: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.products) { product in
                    NavigationLink(
                        destination: ProductDetailsView(path: $path, product: product),
                        tag: product,
                        selection: $viewModel.selectedProduct
                    ) {
                        ProductCard(product: product)
                    }
                }
            }
        }
    }
}
