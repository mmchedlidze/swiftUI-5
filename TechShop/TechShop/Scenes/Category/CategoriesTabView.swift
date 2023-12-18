//
//  CategoriesTabView.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 19.12.23.
//
import SwiftUI

struct CategoriesTabView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            List(viewModel.categories, id: \.self) { category in
                NavigationLink(destination: CategoryDetailView(category: category)) {
                    Text(category)
                }
            }
            .navigationTitle("Categories")
        }
    }
}
