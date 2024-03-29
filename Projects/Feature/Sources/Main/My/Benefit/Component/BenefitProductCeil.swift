//
//  BenefitProductCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct BenefitProductCeil: View {
    
    let productName: String
    let imageUrl: String
    let point: Int
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: imageUrl),
                content: {
                    $0.image?
                        .resizable()
                        .frame(width: 64, height: 64)
                        .addGrayStroke()
                }
            )
            VStack {
                Spacer()
                Text(productName)
                    .font(._body)
                    .toLeading()
                Spacer()
                Text("\(point)P")
                    .font(._label)
                    .toLeading()
                Spacer()
            }
            .padding(.leading, 12)
            Spacer()
            Image(Asset.leftArrow)
                .resizable()
                .frame(width: 20, height: 20)
                .scaleEffect(x: -1, y: 1)
        }
    }
}
