//
//  QuestCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct QuestCeil: View {
    
    var image: String
    var title: String
    
    var body: some View {
        
        let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue, corners: .allCorners)
        
        HStack(spacing: 12) {
            Image(image)
            Text(title)
                .font(._body)
        }
        .frame(height: 60)
        .padding(24)
        .background(Color.gray100)
        .clipShape(roundedCorner)
        .overlay {
            roundedCorner
                .stroke(Color.gray300, lineWidth: 2)
        }
        .padding(.vertical, 1)
    }
}
