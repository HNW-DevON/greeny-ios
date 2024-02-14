//
//  HomeView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem


let dummyQuestData = [(Asset.today, "착하게\n시작하는 하루", 0),
                      (Asset.new, "새 퀘스트", 1),
                      (Asset.calendarWeek, "이번주의 퀘스트", 2)]

let categories = [
    "환경","보육","고용","관광운동",
    "교육","문화재","보건","기타"
]
struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    @EnvironmentObject var tm: TokenManager
    var questCallback: (Int) -> Void
    
    @ViewBuilder
    private var category: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                ForEach(Array((Array(categories[0..<4]).enumerated())), id: \.0) { i in
                    CategoryCeil(name: i.1, idx: i.0)
                }
            }
            HStack(spacing: 8) {
                ForEach(Array((Array(categories[4..<8]).enumerated())), id: \.0) { i in
                    CategoryCeil(name: i.1, idx: i.0 + 4)
                }
            }
        }
    }
    
    var body: some View {
        GreenyTopbar("홈") {
            ScrollView {
                VStack(spacing: 0) {
                    GreenyTitle("오늘의 착한 소비")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            if !vm.isLoading {
                                ForEach(vm.daily, id: \.self) {
                                    TodayCeil(todayGreeny: $0)
                                }
                            } else {
                                ForEach(0..<5, id: \.self) { _ in
                                    VStack(alignment: .leading) {
                                        Rectangle()
                                            .skeleton(with: vm.isLoading,
                                                      animation: .pulse(),
                                                      shape: .rounded(.radius(Size.extraLarge.rawValue)))
                                            .frame(width: 120, height: 120)
                                        Rectangle()
                                            .skeleton(with: vm.isLoading,
                                                      animation: .pulse(),
                                                      shape: .rounded(.radius(Size.extraLarge.rawValue)))
                                            .frame(width: CGFloat.random(in: 30..<100), height: 10)
                                            .padding(.leading, 4)
                                    }
                                }
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .padding(.top, 8)
                    GreenyTitle("카테고리")
                        .padding(.top, 36)
                    category
                        .padding(.top, 8)
                        .padding(.horizontal, 10)
                    GreenyTitle("퀘스트")
                        .padding(.top, 16)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(dummyQuestData, id: \.0) { i in
                                QuestTabCeil(image: i.0, title: i.1)
                                    .onTapGesture {
                                        questCallback(i.2)
                                    }
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .padding(.top, 8)
                }
            }
        }
        .task {
            await vm.loadDaily {
                tm.token = ""
            }
        }
    }
}
