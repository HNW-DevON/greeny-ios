//
//  TodayCompanyCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct TodayCompanyCeil: View {
    
    var company: Company
    
    var body: some View {
        HStack {
//            AsyncImage(
//                url: URL(string: company.),
//                content: {
//                    $0.image?
//                        .resizable()
//                        .frame(width: 64, height: 64)
//                        .addGrayStroke()
//                }
//            )
            VStack {
                Spacer()
                Text(company.companyName)
                    .font(._body)
                    .toLeading()
                Spacer()
                Text(company.companyDesc)
                    .font(._label)
                    .toLeading()
                Spacer()
            }
            .padding(.leading, 12)
            Spacer()
            ForEach(company.companyCategory, id: \.self) {
                let category = Category.fromString($0)
                GreenyTag($0,
                          foregroundColor: category.foregroundColor,
                          backgroundColor: category.backgroundColor)
            }
        }
    }
}
