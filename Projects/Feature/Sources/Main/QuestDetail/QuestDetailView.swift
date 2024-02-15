//
//  QuestDetailView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/15/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct QuestDetailView: View {
    
    @Binding var quest: Quest?
    
    var body: some View {
        VStack {
            Text(quest?.questName ?? "...")
                .font(._subtitle)
            Text(quest?.questState.description ?? "")
                .font(._bodyLight)
                .foregroundStyle(Color.main700)
            let c = quest?.createdAt.components
            if let y = c?.year,
               let m = c?.month,
               let d = c?.day {
                Text("\(y).\(m).\(d)")
                    .foregroundStyle(Color.gray500)
                    .font(._label)
            }
            Text(quest?.questDesc ?? "")
                .font(._label)
                .padding(.top, 8)
        }
        .padding(.horizontal, 28)
    }
}
