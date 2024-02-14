//
//  CompanyView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct CompanyView: View {
    
//    var company: Company

    var body: some View {
        GreenyTopbar("회사 정보") {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("제갈 치킨")
                            .font(._subtitle)
                            .padding(.top, 28)
                        Spacer()
                        
                    }
                    Text("qwdad")
                    Text("회삼ㅇ 에서 진행하는 이벤트")
                    HStack {
                        LazyVStack {
                            
                        }
                        LazyVStack {
                            
                        }
                    }
                }
            }
        }
    }
}
