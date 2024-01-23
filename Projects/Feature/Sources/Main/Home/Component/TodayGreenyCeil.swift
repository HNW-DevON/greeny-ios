//
//  TodayGreenyCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct TodayGreenyCeil: View {
    
    var todayGreeny: TodayGreeny
    
    var body: some View {
        
        let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue, corners: .allCorners)
        
        VStack {
            AsyncImage(
                url: URL(string: todayGreeny.imageUrl),
                content: { image in
                    image.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 120, maxHeight: 120)
                        .clipShape(roundedCorner)
                        .overlay {
                            roundedCorner
                                .stroke(Color.gray100, lineWidth: 1)
                        }
                }
            )
            Text(todayGreeny.productName)
                .font(._label)
                .padding(4)
            Text("\(todayGreeny.author) - \(todayGreeny.createdAt)")
                .font(.caption)
                .padding(.leading, 4)
        }
            
    }
}
