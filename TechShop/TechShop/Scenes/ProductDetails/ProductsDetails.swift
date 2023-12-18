//
//  ProductsDetails.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Binding var path: NavigationPath
    @State private var quantity: Int = 0
    
    var product: Product
    
    var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                imageView
                description
                Spacer()
            }.padding()
        }
    
    var imageView: some View {
        AsyncImage(url: URL(string: product.images.first ?? "")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: .infinity, height: 200)
            } else {
                ProgressView()
            }
        }
    }
    
    private var description: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(product.brand)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                
                Text("$ \(product.price)")
                    .font(.system(size: 16))
                    .foregroundStyle(.blue)
            }
            Text("\(product.description)")
                .font(.system(size: 16))
        }
    }
}




