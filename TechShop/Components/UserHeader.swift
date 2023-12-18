//
//  UserHeader.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

struct UserHeader: View {
    
    @EnvironmentObject var viewmodel: MainViewModel
    
    var body: some View {
        
        HStack(spacing:24) {
            userImage
            userInfo
            cartIcon
        }.padding()
        
    }
    
    private var userInfo: some View {
        
        VStack(alignment: .leading, spacing: 8){
            Text("Hi Soyeon!")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.primary)
            
            HStack(spacing:8) {
                Text("Current Balance: $ \(viewmodel.balance)")
            }
        }
    }
    
    private var userImage: some View {
        
        Image("user")
            .resizable()
            .frame(width: 70 ,height: 70)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    
    private var cartIcon: some View {
        
        Image(systemName: "cart.circle")
            .font(.system(size: 30))
            .foregroundStyle(.black)
        
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .frame(width: 16)
                    .foregroundStyle(.red)
                    .offset(x: 0,y: 0)
                
                Text("\(viewmodel.cart.count)")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .offset(x: 0,y: 0)
            }
    }
}

#Preview {
    UserHeader()
        .environmentObject(MainViewModel())
}
