//
//  LoadingSecondView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

private let gamdongMsg = [
"""
사회적 기업의 제품 사용이
매년 21만평의 열대우림을 지키고 있다는
사실을 알고 계신가요?
""",
"""
일반 영리기업과 경쟁하면서,
사회문제 해결에 있어 시장과 정부의 실패를
보완하는 제3의 영역으로 기능해요
""",
"""
구성원이 전체 이익을 공유함에 따라
양질의 일자리 창출 가능
""",
"""
사회적기업(인증 후 3년) 생존율 91.8%으로
불공정거래 개선에 기여하며
높은 기업생존율을 유지해요!
""",
"""
취약계층의 노동시장 진입을 통해
소득과 부가가치를 창출하고
경제활동 참여인력을 확대합니다!
"""
]

struct LoadingSecondView: View {
    
    let gamdongIdx = Int.random(in: 0..<gamdongMsg.count)
    
    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .foregroundStyle(Color.gray100)
                    .frame(width: 144, height: 144)
                Image("LoadingImage")
                    .foregroundStyle(Color.main600)
                    .frame(width: 144, height: 144)
            }
            Text(gamdongMsg[gamdongIdx])
                .font(._body)
                .multilineTextAlignment(.center)
        }
        .toCenter()
    }
}
