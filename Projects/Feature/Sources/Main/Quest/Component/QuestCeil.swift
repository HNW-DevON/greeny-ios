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
    
    var quest: Quest
    
    var body: some View {
        HStack(spacing: 0) {
            Image(quest.questState.image)
                .resizable()
                .frame(width: 20, height: 20)
            VStack(alignment: .leading, spacing: 4) {
                Text(quest.questName)
                    .foregroundStyle(Color.black)
                    .font(._label)
                Text(quest.questState.description)
                    .foregroundStyle(Color.main600)
                    .font(._caption)
            }
            .padding(.leading, 16)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.gray500)
        }
        .padding(.horizontal, 28)
    }
}
