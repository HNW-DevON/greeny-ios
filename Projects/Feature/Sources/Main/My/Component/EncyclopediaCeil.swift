//
//  EncyclopediaCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/24/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct EncyclopediaCeil: View {
    
    var imageUrl: String
    var productName: String
    
    var body: some View {
        
        let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue, corners: .allCorners)
        
        VStack(spacing: 4) {
            AsyncImage(url: URL(string: imageUrl),
                       content: {
                $0.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(roundedCorner)
                    .overlay {
                        roundedCorner
                            .stroke(Color.gray100, lineWidth: 2)
                    }
            }
            )
            Text(productName)
                .foregroundStyle(Color.gray700)
                .font(._cute)
        }
    }
}
