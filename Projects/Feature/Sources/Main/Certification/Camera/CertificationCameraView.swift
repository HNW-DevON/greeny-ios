//
//  CertificationFirstView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CertificationCameraView: View {
    
    var viewModel: CertificationViewModel
    
    var body: some View {
        ZStack {
            viewModel.cameraPreview.ignoresSafeArea()
                .onAppear {
                    viewModel.configure()
                }
            Image(Asset.cameraRectangle)
                .resizable()
                .frame(width: 200, height: 200)
            Text("네모 안에 상품을 맞춰주세요")
                .foregroundStyle(.white)
                .font(._body)
                .shadow(radius: 3)
                .padding(.top, 200 + 32)
        }
    }
}
