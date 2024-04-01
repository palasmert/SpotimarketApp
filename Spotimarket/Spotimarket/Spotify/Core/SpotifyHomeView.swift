//
//  SpotifyHomeView.swift
//  Spotimarket
//
//  Created by mert palas on 30.03.2024.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
           
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    ForEach(1...10, id: \.self) { count in
                        Section {
                            VStack(spacing: 16) {
                                recentsSection
                                
                                if let product = products.first {
                                    NewReleaseSection(product: product)
                                    
                                }
                            }
                                        
                            .padding(.horizontal, 16)
                            
                               
                            
                            
                            ForEach(0..<20) { _ in
                            Rectangle()
                                    .fill(Color.red)
                                    .frame(width: 200, height: 200)
                            }
                        } header: {
                            header
                        }
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
           
        }
        .task {
            await getData()
        }
        .toolbar(.hidden ,for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DataBaseHelper().getUsers().first
            products = try await Array (DataBaseHelper().getProducts().prefix(8))
            
        } catch {
            
        }
    }
    private var header: some View{
        HStack(spacing: 4){
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
                
            }
            .frame(width: 35,height: 35)

            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
               //         .onTapGesture {
                //          selectedCategory = category
                //    }
                        
                    }
                }
                .padding(.horizontal, 16)
                
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading,8)
        .background(Color.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentCell(
                    imageName: product.firstImage,
                    title: product.title
                )
        
            }
                
        }
    }
    private func NewReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed:{
                
            } ,
            onPlayPressed: {
                
            }
        )
    }
    
}
#Preview {
    SpotifyHomeView()
}
