//
//  CartCard.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

struct CartCard: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .frame(width: .infinity, height: 80)
            
            HStack() {
                cartItems
                Spacer()
                checkout
            }.padding(20)
        }
    }
    
 private var cartItems: some View {
        
        Text("Total: $ \(viewModel.cost)")
            .foregroundColor(.white)
            .font(.system(size: 20))
    }
    
 private var checkout: some View {
        Button(action: {
            viewModel.checkout()
        }) {
            Text("Checkout")
                .padding()
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
        
    }
}

#Preview {
    CartCard()
        .environmentObject(MainViewModel())
}
