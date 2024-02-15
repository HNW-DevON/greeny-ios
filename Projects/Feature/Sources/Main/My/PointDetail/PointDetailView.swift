//
//  PointDetailView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct PointDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    var user: User
    
    var body: some View {
        GreenyTopbar("포인트", backButtonCallback: {
            dismiss()
        }) {
            LazyVStack(spacing: 0) {
                HStack {
                    GreenyLogo(type: .medium)
                    Text("\(user.hasPoint)P")
                        .font(._title)
                        .padding(.leading, 24)
                    Spacer()
                }
                .padding(.top, 24)
                .padding(.leading, 28)
                ForEach(Array(user.pointHistory.enumerated()), id: \.1.id) {
                    let (idx, point) = $0
                    PointCeil(point: point, beforeSame: idx == 0 ? false : user.pointHistory[idx - 1].addedAt == user.pointHistory[idx].addedAt)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
