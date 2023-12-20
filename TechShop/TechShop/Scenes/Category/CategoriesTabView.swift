//
//  CategoriesTabView.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 19.12.23.
//
import SwiftUI

struct CategoriesTabView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Binding var path: NavigationPath

    var body: some View {
        NavigationView {
            List(viewModel.categories, id: \.self) { category in
                NavigationLink(destination: CategoryDetailView(category: category, path: $path)) {
                    Text(category)
                }
            }
            .navigationTitle("Categories")
        }
    }
}
