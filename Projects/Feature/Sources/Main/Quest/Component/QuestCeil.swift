//
//  QuestCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/27/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import Service

struct QuestCeil: View {
    
    let state: QuestState
    let title: String
    
    var body: some View {
        HStack(spacing: 0) {
            Image(state.image)
                .resizable()
                .frame(width: 20, height: 20)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(._label)
                Text(state.description)
                    .foregroundStyle(Color.main600)
                    .font(._caption)
            }
            .padding(.leading, 16)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal, 28)
    }
}
