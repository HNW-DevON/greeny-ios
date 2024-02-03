//
//  GreenyBottomCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

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

struct GreenyCameraBottomCeil: View {
    
    @State var textOpacitiy = 1.0
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .center) {
                Circle()
                    .foregroundStyle(Color.main600)
                    .frame(width: 52, height: 52)
                Image(Asset.certification)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 36, height: 36)
                    .foregroundStyle(Color.white)
            }
            if textOpacitiy > 0.0 {
                Text(GreenyBottomNavigatorType.certification.title)
                    .font(._cute)
                    .foregroundStyle(Color.gray500)
                    .opacity(textOpacitiy)
            }
        }
        .onAppear {
            withAnimation {
                textOpacitiy = 0.0
            }
        }
    }
}
