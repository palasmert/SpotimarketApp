//
//  ImageLoaderView.swift
//  Spotimarket
//
//  Created by mert palas on 29.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(  WebImage(url: URL(string: urlString))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: resizingMode)
                .allowsHitTesting(false)
        )
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
    //Rectangle()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 40)
}
