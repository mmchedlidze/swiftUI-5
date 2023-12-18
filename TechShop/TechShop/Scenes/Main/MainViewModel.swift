//
//  MainViewModel.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var balance = 3700
    @Published var products: [Product] = []
    @Published var cart: [Cart] = []
    @Published var cost: Int = 0
    @Published var error: String?
    @Published var categories: [String] = []
    @Published var isPaymentConfirmed: Bool = false
    @Published var isRejected: Bool = false
    
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        let urlString = "https://dummyjson.com/products"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ProductsData.self, completion: { result in
            switch result {
            case .success(let data):
                self.products = data.products
                self.categories = Set(data.products.map { $0.category }).sorted()
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }
    
    func addToCart(product: Product) {
        
        let price = product.price
        
        if balance >= price {
            if let index = cart.firstIndex(where: { $0.product.id == product.id }) {
                cost += product.price
                cart[index].quantity += 1
                balance -= price
            } else {
                let newItem = Cart(product: product, quantity: 1)
                cart.append(newItem)
                cost += product.price
                balance -= price
            }
        } else {
            isRejected = true
        }
    }
    
    func checkout() {
        cost = 0
        cart = []
        isPaymentConfirmed = true
    }

}

