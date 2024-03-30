//
//  SpotifyHomeView.swift
//  Spotimarket
//
//  Created by mert palas on 30.03.2024.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
           
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    ForEach(1...10, id: \.self) { count in
                        Section {
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
            //products = try await DataBaseHelper().getProducts()
            
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
                            isSeleceted: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                        
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
}
#Preview {
    SpotifyHomeView()
}
