//
//  ContentView.swift
//  Spotimarket
//
//  Created by mert palas on 29.03.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView{
            ForEach(products) { products in
                Text(products.title)
                    .foregroundStyle(.spotifyGreen)
            }
        }
    
        .padding()
        .task {
            await getData()
        }
    }
    private func getData() async {
        do {
            users = try await DataBaseHelper().getUsers()
            products = try await DataBaseHelper().getProducts()
            
        } catch {
            
        }
    }
}



#Preview {
    ContentView()
}

