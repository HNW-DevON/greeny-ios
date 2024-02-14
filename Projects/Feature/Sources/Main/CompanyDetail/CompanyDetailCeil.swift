//
//  CompanyDetailCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import Service
import DesignSystem

struct CompanyDetailCeil: View {
    
    let company: Company
    
    var body: some View {
        NavigationLink {
            CompanyView(company: company)
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                Text(company.companyName)
                    .foregroundStyle(Color.black)
                    .font(._subtitle)
                    .padding(.leading, 4)
                Text(company.companyDesc)
                    .foregroundStyle(Color.gray500)
                    .font(._label)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                HStack {
                    ForEach(company.companyCategory, id: \.self) { category in
                        GreenyTag(category, foregroundColor: Color.green500, backgroundColor: Color.green)
                    }
                }
                .padding(.top, 4)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
        }
    }
}
