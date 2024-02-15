//
//  BenefitView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

fileprivate let dummyProducts = [
    ("https://hws.dev/paul.jpg", "착한 치킨", 101),
    ("https://hws.dev/paul.jpg", "착한 치킨", 102),
    ("https://hws.dev/paul.jpg", "착한 치킨", 103),
    ("https://hws.dev/paul.jpg", "착한 치킨", 104),
    ("https://hws.dev/paul.jpg", "착한 치킨", 105),
    ("https://hws.dev/paul.jpg", "착한 치킨", 106)
]

struct BenefitView: View {
    
    @Environment(\.dismiss) var dismiss
    var user: User
    
    var body: some View {
        GreenyTopbar("혜택 보기", backButtonCallback: {
            dismiss()
        }) {
            ScrollView {
                VStack(spacing: 0) {
                    PointDetailCeil(name: user.name, point: user.hasPoint, user: user)
                        .padding(.top, 32)
                    Text("포인트로 착한소비하기")
                        .font(._body)
                        .padding(.top, 32)
                        .padding(.leading, 24)
                        .toLeading()
                    //                    VStack(spacing: 12) {
                    //                        ForEach(dummyProducts, id: \.2) {
                    //                            BenefitProductCeil(productName: $0.1, imageUrl: $0.0, point: $0.2)
                    //                                .padding(.horizontal, 28)
                    //                        }
                    //                    }
                    Text("아직 받으실 수 있는 혜택이 없어요ㅠㅠ")
                        .font(._bodyLight)
                        .padding(.top, 72)
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
