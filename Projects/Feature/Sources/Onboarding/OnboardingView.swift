//
//  OnboardingView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct OnboardingView: View {
    
    @State var selectedTab: Int = 0
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    TabView(selection: $selectedTab) {
                        GreenyOnboardingImage(image: "Onboarding1",
                                              title: "사회적 기업이란?",
                                              description: "영리기업과 비영리기업의 중간 형태")
                        .tag(0)
                        GreenyOnboardingImage(image: "Onboarding2",
                                              title: "",
                                              description: "사회적 목적을 우선적으로 생산 / 판매 등\n영업활동등을 수행하는 기업")
                        .tag(1)
                        GreenyOnboardingImage(image: "Onboarding3",
                                              title: "착한소비란?", 
                                              description: "소비자들의 올바른 사회적 소비를 위하여\n검색, 인증, 혜택 서비를 제공")
                        .tag(2)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 320)
                    .padding(.bottom, 20)
                    HStack(spacing: 8) {
                        ForEach(0..<3) {
                            let isSelectedTab = selectedTab == $0
                            let indicatorColor = isSelectedTab ? Color.main600 : Color.gray300
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundStyle(indicatorColor)
                        }
                    }
                }
                VStack {
                    Spacer()
                    NavigationLink {
                        LoginView()
                    } label: {
                        GreenyButton("시작하기") {}.disabled(true)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 20)
                    }
                }
            }
        }
    }
}
