//
//  SpotifyCategoryCell.swift
//  Spotimarket
//
//  Created by mert palas on 30.03.2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSeleceted: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.vertical, 8)
            .frame(minWidth: 35)
            .padding(.horizontal, 10)
            .background(isSeleceted ? .spotifyGreen: .spotifyDarkGrey)
            .foregroundStyle(isSeleceted ? .spotifyBlack: .spotifyWhite)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSeleceted: true)
            SpotifyCategoryCell(isSeleceted: true)

            
        }
    }
}
