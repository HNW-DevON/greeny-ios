//
//  BenefitView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

fileprivate let dummyProducts = [
    ("https://hws.dev/paul.jpg", "착한 치킨", 101),
    ("https://hws.dev/paul.jpg", "착한 치킨", 102),
    ("https://hws.dev/paul.jpg", "착한 치킨", 103),
    ("https://hws.dev/paul.jpg", "착한 치킨", 104),
    ("https://hws.dev/paul.jpg", "착한 치킨", 105),
    ("https://hws.dev/paul.jpg", "착한 치킨", 106)
]

struct BenefitView: View {
    var body: some View {
        GreenyTopbar("혜택 보기") {
            ScrollView {
                VStack(spacing: 0) {
                    Text("노자손 님의 포인트는...")
                        .font(._body)
                        .padding(.top, 32)
                        .toLeading()
                    HStack {
                        GreenyLogo(type: .medium)
                        Text("120P")
                            .font(._title)
                            .padding(.leading, 24)
                        Spacer()
                        Image(Asset.leftArrow)
                            .scaleEffect(x: -1, y: 1)
                            .padding(.trailing, 24)
                    }
                    .padding(.top, 24)
                    .padding(.leading, 28)
                    Text("포인트로 착한소비하기")
                        .font(._body)
                        .padding(.top, 32)
                        .toLeading()
                    ForEach(dummyProducts, id: \.2) {
                        BenefitProductCeil(productName: $0.1, imageUrl: $0.0, point: $0.2)
                            .padding(.horizontal, 28)
                    }
                }
            }
        }
    }
}
