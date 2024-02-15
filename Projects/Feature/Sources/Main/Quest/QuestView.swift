//
//  QuestView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/25/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct QuestView: View {
    
    @Binding var selectedQuestType: Int {
        didSet {
            Task {
                await vm.loadCompleteOrDoingQuest(idx: selectedQuestType) {
                    tm.token = ""
                }
                await vm.loadDone(idx: selectedQuestType) {
                    tm.token = ""
                }
                isQuestDetail = false
            }
        }
    }
    @State private var rect: CGRect = .zero
    @ObservedObject var vm = QuestViewModel()
    @EnvironmentObject var tm: TokenManager
    @State var isQuestDetail = false
    @State var selectedQuest: Quest? = nil {
        didSet {
            if selectedQuest != nil {
                isQuestDetail = true
            }
        }
    }
    
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
                    .foregroundStyle(vm.selectedQuestTab == tab ? Color.main700 : Color.black)
                    .font(._bodyLight)
                    .overlay(
                        Rectangle()
                            .foregroundStyle(vm.selectedQuestTab == tab ? Color.main700 : Color.white)
                            .frame(height: 1)
                            .offset(y: 2),
                        alignment: .bottom
                    )
                    .onTapGesture {
                        vm.selectedQuestTab = tab
                    }
            }
        }
    }
    
    @ViewBuilder
    private var doing: some View {
        ScrollView {
            LazyVStack(spacing: 36) {
                ForEach(vm.completeOrDoingQuest) { quest in
                    Button {
                        selectedQuest = quest
                    } label: {
                        QuestCeil(quest: quest)
                    }
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var yet: some View {
        ScrollView {
            LazyVStack(spacing: 36) {
                ForEach(vm.doneQuest) { quest in
                    Button {
                        selectedQuest = quest
                    } label: {
                        QuestCeil(quest: quest)
                    }
                }
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var questContent: some View {
        TabView(selection: $vm.selectedQuestTab) {
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
        .task {
            await vm.loadCompleteOrDoingQuest(idx: selectedQuestType) {
                tm.token = ""
            }
            await vm.loadDone(idx: selectedQuestType) {
                tm.token = ""
            }
        }
        .sheet(isPresented: $isQuestDetail) {
            QuestDetailView(quest: $selectedQuest) {
                Task {
                    await vm.completeQuest(quest: selectedQuest!) {
                        Task {
                            await vm.loadCompleteOrDoingQuest(idx: selectedQuestType) {
                                tm.token = ""
                            }
                            await vm.loadDone(idx: selectedQuestType) {
                                tm.token = ""
                            }
                            isQuestDetail = false
                        }
                    } onFail: {
                        tm.token = ""
                    }
                }
            }
            .presentationDetents([.height(240), .medium, .large])
        }
    }
}
