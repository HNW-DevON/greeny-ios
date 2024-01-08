//
//  GreenyOnboardingImage.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct GreenyOnboardingImage: View {
    
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(image)
                .resizable()
                .frame(width: 216, height: 216)
                .padding(.bottom, 48)
            if !title.isEmpty {
                Text(title)
                    .padding(.bottom, 4)
                    .font(._subtitle)
                    .multilineTextAlignment(.center)
            }
            
            Text(description)
                .foregroundStyle(Color.gray500)
                .font(._caption)
                .multilineTextAlignment(.center)
        }
    }
}
