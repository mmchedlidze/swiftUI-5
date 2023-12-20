//
//  MainView.swift
//  TechShop
//
//  Created by Mariam Mchedlidze on 18.12.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    @State private var selectedTab = 0
    
    let gridLayout = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible())
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                VStack(spacing: 12) {
                    UserHeader()
                    productsView
                    CartCard()
                }
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(0)
            
            CategoriesTabView(path: $path)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Categories")
                }
                .tag(1)
        }.alert(item: $viewModel.alertOption) { alertOption in
            switch alertOption {
            case .paymentConfirmed:
                return Alert(
                    title: Text("Payment Confirmed"),
                    message: Text("Your payment has been confirmed."),
                    dismissButton: .default(Text("OK"))
                )

            case .paymentRejected:
                return Alert(
                    title: Text("Payment Rejected"),
                    message: Text("Your payment has been rejected."),
                    dismissButton: .default(Text("OK"))
                )

            case .otherAlert(title: let title, message: let message, dismissButtonTitle: let dismissButtonTitle):
                return Alert(
                    title: Text(title),
                    message: Text(message),
                    dismissButton: .default(Text(dismissButtonTitle))
                )
            }
        }
    }
    
    private var productsView: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.products) { product in
                    
                    NavigationLink(value: product) {
                        ProductCard(product: product)
                    }
                    .navigationDestination(for: Product.self, destination: { product in
                        ProductDetailsView(path: $path, product: product)
                    })
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}

