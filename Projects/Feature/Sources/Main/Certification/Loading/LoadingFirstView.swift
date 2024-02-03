//
//  LoadingView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

struct LoadingFirstView: View {
    
    @State var opacity = 0.0
    
    var body: some View {
        VStack(spacing: 24) {
            Circle()
                .foregroundStyle(Color.main600)
                .frame(width: 144, height: 144)
            Text("상품을 분석중이에요")
                .font(._body)
        }
        .opacity(opacity)
        .toCenter()
        .onAppear {
            withAnimation {
                opacity = 1
            }
        }
    }
}
