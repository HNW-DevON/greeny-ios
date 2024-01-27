//
//  QuestView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/25/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

fileprivate let dummyDoingQuest = [
    ("이강현과 가위바위보해서 이기기 ", false),
    ("아 배고프다 오늘 점심 ㅜ머지", false),
    ("이강현 캄보디아에서 내 선물 사와1", false),
    ("이강현 캄보디아에서 내 선물 사와2", false),
    ("이강현 출국심사 안잡히고 출국하기1", true),
    ("이강현 출국심사 안잡히고 출국하기2", true)
]

struct QuestView: View {
    
    @ViewBuilder
    private var questTab: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(dummyQuestData, id: \.0) {
                    QuestTabCeil(image: $0.0, title: $0.1)
                }
            }
            .padding(.leading, 16)
        }
    }
    
    @ViewBuilder
    private var doing: some View {
        LazyVStack(spacing: 36) {
            ForEach(dummyDoingQuest, id: \.0) { i in
                QuestCeil(state: i.1 ? .complete : .doing, title: i.0)
            }
        }
    }
    
    @ViewBuilder
    private var yet: some View {
        LazyVStack(spacing: 36) {
            ForEach(dummyDoingQuest, id: \.0) { i in
                QuestCeil(state: i.1 ? .complete : .doing, title: i.0)
            }
        }
    }
    
    @ViewBuilder
    private var questContent: some View {
        TabView {
            doing
            yet
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    var body: some View {
        GreenyTopbar("퀘스트") {
            ScrollView {
                VStack {
                    questTab.padding(.top, 8)
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
