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
    
    var company: Company
    @Environment(\.dismiss) var dismiss

    var body: some View {
        GreenyTopbar("회사 정보") {
            dismiss()
        } content:  {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 8) {
                        ForEach(company.companyCategory, id: \.self) {
                            GreenyTag($0, foregroundColor: .gray, backgroundColor: .red)
                        }
                    }
                    .padding(.top, 28)
                    .padding(.leading, 4)
                    Text(company.companyName)
                        .font(._title)
                        .toLeading()
                        .padding(.top, 8)
                        .padding(.leading, 4)
                    Text(company.companyDesc)
                        .foregroundStyle(Color.gray500)
                        .font(._bodyLight)
                        .padding(.top, 4)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 4)
                        .toLeading()
                    Divider()
                        .padding(.top, 16)
                    Text("\(company.companyName)에서 진행하는 이벤트")
                        .font(._subtitle)
                        .toLeading()
                        .padding(.top, 16)
                    LazyVStack(spacing: 8) {
                        ForEach(company.event, id: \.id) { event in
                            EventView(event: event)
                        }
                    }
                    .padding(.top, 12)
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
