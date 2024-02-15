//
//  EncyclopediaCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/24/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct EncyclopediaCeil: View {
    
    var product: Product
    
    var body: some View {
        
        let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue, corners: .allCorners)
        
        VStack(spacing: 4) {
            AsyncImage(url: URL(string: (product.images?.first ?? "") ?? "")) {
                $0
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(roundedCorner)
                    .overlay {
                        roundedCorner
                            .stroke(Color.gray100, lineWidth: 2)
                    }
            } placeholder: {
                Rectangle()
                    .addGrayStroke(color: .gray300)
            }
            Text(product.baseItems?.first??.value ?? "")
                .lineLimit(1)
                .foregroundStyle(Color.gray700)
                .font(._cute)
                .truncationMode(.tail)
        }
    }
}
