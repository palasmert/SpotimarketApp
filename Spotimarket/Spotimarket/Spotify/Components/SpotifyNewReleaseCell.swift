//
//  SpotifyNewReleaseCell.swift
//  Spotimarket
//
//  Created by mert palas on 1.04.2024.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New Release from"
    var subheadline: String? = "Some artist"
    var title: String? = "Some playlist"
    var subtitle: String? = "Single-title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading ,spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGrey)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGrey)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGrey)
                            .font(.title3)
                            .padding(4)
                            .background(Color.blue.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                                
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                          
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
    
        SpotifyNewReleaseCell()
            .padding()

    }
}
