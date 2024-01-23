//
//  HomeView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct Today: Hashable {
    let imageUrl: String
    let productName: String
    let author: String
    let createdAt: String
}

fileprivate let dummyTodayData = [
    Today(imageUrl: "https://hws.dev/paul.jpg", productName: "착한치킨", author: "이슬아", createdAt: "2시간 전"),
    Today(imageUrl: "https://hws.dev/paul.jpg", productName: "착한치킨", author: "이슬아", createdAt: "2시간 전"),
    Today(imageUrl: "https://hws.dev/paul.jpg", productName: "착한치킨", author: "이슬아", createdAt: "2시간 전"),
]

fileprivate let dummyQuestData = [
    ("Today", "착하게\n시작하는 하루"),
    ("New", "새 퀘스트")
]

struct HomeView: View {
    
    var body: some View {
        GreenyTopbar("홈") {
            ScrollView {
                VStack(spacing: 0) {
                    GreenyTitle("오늘의 착한 소비")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(dummyTodayData, id: \.self) {
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
                                QuestCeil(image: $0.0, title: $0.1)
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
