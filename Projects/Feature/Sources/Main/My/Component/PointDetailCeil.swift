//
//  PointDetailCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct PointDetailCeil: View {
    
    let name: String
    let point: Int
    
    var body: some View {
        VStack {
            Text("\(name) 님의 포인트는...")
                .font(._body)
                .padding(.leading, 24)
                .toLeading()
            HStack {
                GreenyLogo(type: .medium)
                Text("\(point)P")
                    .font(._title)
                    .padding(.leading, 24)
                Spacer()
                Image(Asset.leftArrow)
                    .scaleEffect(x: -1, y: 1)
                    .padding(.trailing, 24)
            }
            .padding(.top, 24)
            .padding(.leading, 28)
        }
        
    }
}
