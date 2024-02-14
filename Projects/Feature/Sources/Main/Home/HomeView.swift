//
//  HomeView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem


let dummyQuestData = [(Asset.today, "착하게\n시작하는 하루"),
                      (Asset.new, "새 퀘스트"),
                      (Asset.calendarWeek, "이번주의 퀘스트")]

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModel()
    
    var body: some View {
        GreenyTopbar("홈") {
            ScrollView {
                VStack(spacing: 0) {
                    GreenyTitle("오늘의 착한 소비")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(vm.daily, id: \.self) {
                                TodayCeil(todayGreeny: $0)
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .padding(.top, 8)
                    GreenyTitle("카테고리")
                        .padding(.top, 36)
                    GreenyTitle("퀘스트")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(dummyQuestData, id: \.0) {
                                QuestTabCeil(image: $0.0, title: $0.1)
                            }
                        }
                        .padding(.leading, 16)
                    }
                    .padding(.top, 8)
                }
            }
        }
    }
}
