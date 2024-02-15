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
    
    var todayGreeny: Daily
    
    var body: some View {
        
        let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue, corners: .allCorners)
        
        VStack(spacing: 0) {
            AsyncImage(
                url: URL(string: (todayGreeny.product.images?.first ?? "") ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .addGrayStroke()
                } placeholder: {
                    Rectangle()
                        .foregroundStyle(Color.gray100)
                        .frame(width: 120, height: 120)
                        .addGrayStroke()
                }
            Text(todayGreeny.product.baseItems?.first??.value)
                .font(._label)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(4)
                .toLeading()
            Text("\(todayGreeny.username) - \(todayGreeny.addedAt.timeAgoString())")
                .font(.caption)
                .padding(.leading, 4)
                .toLeading()
                .foregroundStyle(Color.gray700)
        }
        .frame(width: 120)
    }
}
