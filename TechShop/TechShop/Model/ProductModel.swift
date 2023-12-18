//
//  ProductModel.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

struct ProductsData: Decodable, Hashable {
    var products: [Product]
}

struct Product: Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
}

struct Cart {
    var product: Product
    var quantity: Int
}
