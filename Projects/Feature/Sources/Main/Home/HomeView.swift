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

fileprivate let dummyTodayGreenyData = [
    Today(imageUrl: "https://hws.dev/paul.jpg", productName: "착한치킨", author: "이슬아", createdAt: "2시간 전"),
    Today(imageUrl: "https://hws.dev/paul.jpg", productName: "착한치킨", author: "이슬아", createdAt: "2시간 전"),
    Today(imageUrl: "https://hws.dev/paul.jpg", productName: "착한치킨", author: "이슬아", createdAt: "2시간 전"),
]

public struct HomeView: View {
    
    public init() {}
    
    public var body: some View {
        GreenyTopbar("홈") {
            ScrollView {
                VStack(spacing: 0) {
                    GreenyTitle("오늘의 착한 소비")
                        .padding(.top, 20)
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(dummyTodayGreenyData, id: \.self) {
                                TodayCeil(todayGreeny: $0)
                            }
                        }
                        .padding(.top, 8)
                        .padding(.leading, 16)
                    }
                    GreenyTitle("카테고리")
                        .padding(.top, 36)
                    GreenyTitle("퀘스트")
                }
            }
        }
    }
}
