//
//  QuestView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/25/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct QuestView: View {
    var body: some View {
        GreenyTopbar("퀘스트") {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(dummyQuestData, id: \.0) {
                            QuestCeil(image: $0.0, title: $0.1)
                        }
                    }
                    .padding(.leading, 16)
                }
                .padding(.top, 8)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
