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
    ("이강현 출국심사 안잡히고 출국하기0", true),
    ("이강현 출국심사 안잡히고 출국하기1", true),
    ("이강현 출국심사 안잡히고 출국하기2", true),
    ("이강현 출국심사 안잡히고 출국하기3", true),
    ("이강현 출국심사 안잡히고 출국하기4", true),
    ("이강현 출국심사 안잡히고 출국하기5", true)
]

struct QuestView: View {
    
    @Binding var selectedQuestType: Int
    @State private var rect: CGRect = .zero
    @State var selectedQuestTab = QuestTabViewType.completeOrDoing
    
    @ViewBuilder
    private var questTab: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(dummyQuestData, id: \.0) { i in
                    QuestTabCeil(image: i.0, title: i.1)
                        .onTapGesture {
                            selectedQuestType = i.2
                        }
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder
    private var questIndicator: some View {
        HStack {
            ForEach(QuestTabViewType.allCases, id: \.text) { tab in
                Text(tab.text)
                    .foregroundStyle(selectedQuestTab == tab ? Color.main700 : Color.black)
                    .font(._bodyLight)
                    .overlay(
                        Rectangle()
                            .foregroundStyle(selectedQuestTab == tab ? Color.main700 : Color.white)
                            .frame(height: 1)
                            .offset(y: 2),
                        alignment: .bottom
                    )
                    .onTapGesture {
                        selectedQuestTab = tab
                    }
            }
        }
    }
    
    @ViewBuilder
    private var doing: some View {
        ScrollView {
            LazyVStack(spacing: 36) {
                ForEach(dummyDoingQuest + dummyDoingQuest, id: \.0) { i in
                    QuestCeil(state: i.1 ? .complete : .doing, title: i.0)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var yet: some View {
        ScrollView {
            LazyVStack(spacing: 36) {
                ForEach(dummyDoingQuest, id: \.0) { i in
                    QuestCeil(state: i.1 ? .complete : .doing, title: i.0)
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var questContent: some View {
        TabView(selection: $selectedQuestTab) {
            doing.tag(QuestTabViewType.completeOrDoing)
            yet.tag(QuestTabViewType.done)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    var body: some View {
        GreenyTopbar("퀘스트") {
            VStack {
                questTab.padding(.top, 8)
                questIndicator
                    .toLeading()
                    .padding(.top, 24)
                    .padding(.bottom, 16)
                    .padding(.horizontal, 24)
                questContent
            }
        }
        .navigationBarBackButtonHidden()
    }
}
