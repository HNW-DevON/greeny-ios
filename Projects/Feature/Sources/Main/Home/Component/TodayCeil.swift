//
//  TodayGreenyCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct TodayCeil: View {
    
    var todayGreeny: Product
    
    var body: some View {
        
        let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue, corners: .allCorners)
        
        VStack(spacing: 0) {
            AsyncImage(
                url: URL(string: todayGreeny.images.first ?? ""),
                content: { image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 120, maxHeight: 120)
                        .addGrayStroke()
                }
            )
            Text(todayGreeny.baseItems.first?.value)
                .font(._label)
                .padding(4)
                .toLeading()
//            Text("\(todayGreeny.author) - \(todayGreeny.createdAt)")
//                .font(.caption)
//                .padding(.leading, 4)
//                .toLeading()
//                .foregroundStyle(Color.gray700)
        }
    }
}
