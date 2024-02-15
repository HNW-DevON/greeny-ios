//
//  LoadingView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import Lottie

struct LoadingFirstView: View {
    
    @State var opacity = 0.0
    
    var body: some View {
        VStack(spacing: 24) {
            LottieView(jsonName: "ani")
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
