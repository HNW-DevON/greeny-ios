//
//  PointDetailView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct PointDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GreenyTopbar("포인트", backButtonCallback: {
            dismiss()
        }) {
            ScrollView {
                HStack {
                    GreenyLogo(type: .medium)
                    Text("100P")
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
        .navigationBarBackButtonHidden()
    }
}
