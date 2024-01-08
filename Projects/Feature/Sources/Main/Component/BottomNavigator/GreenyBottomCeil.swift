//
//  GreenyBottomCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

struct GreenyBottomCeil: View {
    
    let isSelected: Bool
    let bottomType: GreenyBottomNavigatorType
    
    var body: some View {
        
        let imageColor = isSelected ? Color.main600 : Color.gray400
        let textColor = isSelected ? Color.black : Color.gray500
        
        VStack(spacing: 0) {
            Image(bottomType.image)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(imageColor)
                .frame(width: 28, height: 28)
            Text(bottomType.title)
                .font(._cute)
                .foregroundStyle(textColor)
        }
    }
}
