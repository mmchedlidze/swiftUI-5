//
//  ProductCard.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

struct ProductCard: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            imageView
            infoView
            addToButton
        }
    }
    
    private var imageView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(CGColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 0.1)))
                .frame(width: 170, height: 163)
            
            AsyncImage(url: URL(string: product.images.first ?? "")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 100, height: 140)
                } else {
                    ProgressView()
                }
            }
        }
    }
    
    private var infoView: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(product.title)
                .foregroundColor(.primary)
                .font(.system(size: 18, weight: .regular))
                .lineLimit(1)
            
            Text("$ \(product.price)")
                .foregroundColor(.primary)
                .font(.system(size: 14, weight: .regular))
        }
    }
    
    private var addToButton: some View {
        Button(action: {
            viewModel.addToCart(product: product)
        }) {
            Text("Add to Cart")
                .padding(8)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
