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

struct EarnPointView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = EarnPointViewModel()
    @EnvironmentObject var tm: TokenManager
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
                        ForEach(vm.todayCompanies, id: \.id) {
                            TodayCompanyCeil(company: $0)
                                .padding(.horizontal, 28)
                        }
                    }
                    .padding(.top, 16)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            await vm.loadCompanies {
                tm.token = ""
            }
        }
    }
}
