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
    @Published var alertOption: AlertOption? = nil
    @Published var selectedProduct: Product?
    
    
    enum AlertOption: Identifiable {
        case paymentConfirmed
        case paymentRejected
        case otherAlert(title: String, message: String, dismissButtonTitle: String)
        
        var id: Int {
            switch self {
            case .paymentConfirmed:
                return 0
            case .paymentRejected:
                return 1
            case .otherAlert(title: _, message: _, dismissButtonTitle: _):
                return 2
                
            }
        }
    }
    
    
    @Published var isPaymentConfirmed: Bool = false {
        didSet {
            if isPaymentConfirmed {
                alertOption = .paymentConfirmed
                isPaymentConfirmed = false
            }
        }
    }
    
    @Published var isPaymentRejected: Bool = false {
        didSet {
            if isPaymentRejected {
                alertOption = .paymentRejected
                isPaymentRejected = false  // Reset the flag
            }
        }
    }
    
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
        
        if let index = cart.firstIndex(where: { $0.product.id == product.id }) {
            cost += product.price
            cart[index].quantity += 1
        } else {
            let newItem = Cart(product: product, quantity: 1)
            cart.append(newItem)
            cost += product.price
        }
    }
    
    func checkout() {
        if balance >= cost {
            balance -= cost
            cost = 0
            cart = []
            isPaymentConfirmed = true
        }
        else {
            balance -= cost
            cost = 0
            cart = []
            isPaymentRejected = true
        }
    }
    
}

