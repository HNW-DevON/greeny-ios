//
//  EarnPointVIew.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

fileprivate let dummyProducts = [
    ("https://hws.dev/paul.jpg", "착한 치킨", "선캄브리아 제갈 치킨"),
    ("https://hws.dev/paul.jpg", "착한 치킨", "선캄브리아 제갈 치킨"),
    ("https://hws.dev/paul.jpg", "착한 치킨", "선캄브리아 제갈 치킨"),
    ("https://hws.dev/paul.jpg", "착한 치킨", "선캄브리아 제갈 치킨"),
    ("https://hws.dev/paul.jpg", "착한 치킨", "선캄브리아 제갈 치킨"),
    ("https://hws.dev/paul.jpg", "착한 치킨", "선캄브리아 제갈 치킨")
]

struct EarnPointView: View {
    
    @Environment(\.dismiss) var dismiss
    var user: User
    
    var body: some View {
        GreenyTopbar("포인트 얻는 법", backButtonCallback: {
            dismiss()
        }) {
            ScrollView {
                VStack(spacing: 0) {
                    PointDetailCeil(name: "노자손", point: 100, user: user)
                        .padding(.top, 32)
                    Text("사회적 기업의 제품을 소비하고\n포인트를 얻어보세요")
                        .foregroundStyle(Color.main700)
                        .font(._label)
                        .toLeading()
                        .padding(.leading, 24)
                        .padding(.top, 32)
                    Text("오늘의 사회적 기업")
                        .font(._body)
                        .padding(.top, 24)
                        .padding(.leading, 24)
                        .toLeading()
                    VStack(spacing: 12) {
                        ForEach(dummyProducts, id: \.2) {
                            TodayCompanyCeil(productName: $0.1, imageUrl: $0.0, description: $0.2)
                                .padding(.horizontal, 28)
                        }
                    }
                    .padding(.top, 16)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
