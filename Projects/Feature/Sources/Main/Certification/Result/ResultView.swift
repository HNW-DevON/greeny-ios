//
//  ResultView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct ResultView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = ResultViewModel()
    
    
    @ViewBuilder
    private var product: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"),
                       content: {
                $0.image?
                    .resizable()
                    .frame(width: 150, height: 150)
                    .addGrayStroke()
            }
            )
            VStack(alignment: .leading, spacing: 0) {
                Text("망고맛치킨")
                    .font(._body)
                Text("히히 망고. 망고는 맛있어. 맛있으면\n망고")
                    .font(._caption)
                    .padding(.top, 4)
                HStack(spacing: 0) {
                    Text("312")
                        .foregroundStyle(Color.main600)
                        .font(._cute)
                    Text("번 인증된 제품이에요.")
                        .foregroundStyle(Color.gray500)
                        .font(._cute)
                }
                .padding(6)
                .background(Color.gray100)
                .clipShape(RoundedCorner(radius: 8))
                .padding(.top, 12)
            }
            .padding(.top, 4)
            .toLeading()
        }
    }
    
    @ViewBuilder
    private var company: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"),
                       content: {
                $0.image?
                    .resizable()
                    .frame(width: 150, height: 150)
                    .addGrayStroke()
            }
            )
            VStack(alignment: .leading, spacing: 0) {
                Text("제갈치킨")
                    .font(._body)
                Text("선캄브리아 시대부터 춘추제갈\n시대를 지나 현대 문명에 큰 기축을\n담당한 사회적 기업의 근본 중의\n근본 치킨 매장이다.")
                    .font(._caption)
                    .padding(.top, 4)
                HStack(spacing: 0) {
                    Text("환경")
                        .foregroundStyle(Color(0x47AF23))
                        .font(._cute)
                }
                .padding(6)
                .background(Color(0xCBFFCD))
                .clipShape(RoundedCorner(radius: 8))
                .padding(.top, 12)
            }
            .padding(.top, 4)
            .toLeading()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("분석된 결과는...")
                    .font(._title)
                    .toLeading()
                    .padding(.leading, 20)
                product
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                Text("기업 정보")
                    .font(._title)
                    .toLeading()
                    .padding(.leading, 20)
                    .padding(.top, 24)
                company
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
            }
        }
    }
    
    var body: some View {
        GreenyTopbar("인증", backButtonCallback: vm.viewType == .result ? {
            dismiss()
        } : nil) {
            Group {
                switch vm.viewType {
                case .loadingFirst:
                    LoadingFirstView()
                case .loadingSecond:
                    LoadingSecondView()
                case .result:
                    content
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            withAnimation {
                vm.loadView()
            }
        }
    }
}

