//
//  SpotifyCategoryCell.swift
//  Spotimarket
//
//  Created by mert palas on 30.03.2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.vertical, 8)
            .frame(minWidth: 35)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)
    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View{
        self
            .background(isSelected ? .spotifyGreen: .spotifyDarkGrey)
            .foregroundStyle(isSelected ? .spotifyBlack: .spotifyWhite)
    }
}


#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected:  true)
            SpotifyCategoryCell(isSelected: true)

            
        }
    }
}
