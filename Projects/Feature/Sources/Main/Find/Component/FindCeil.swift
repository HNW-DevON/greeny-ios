//
//  FindCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import Service

struct FindCeil: View {
    
    let item: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            let height = CGFloat.random(in: 124...220)
            AsyncImage(url: URL(string: item.images.first ?? "")) {
                $0
                    .resizable()
                    .addGrayStroke()
                    .frame(height: height)
            } placeholder: {
                Rectangle()
                    .foregroundStyle(Color.gray100)
                    .addGrayStroke()
                    .frame(height: height)
            }
            Text(item.baseItems.first?.value ?? "")
                .font(._caption)
                .bold()
                .padding(.top, 12)
            Text(item.companies.first?.name ?? "")
                .font(._cute)
            //            Text("오늘 10명의 사용자가 소비하고 있어요")
            //                .font(._cute)
            //                .padding(.top, 8)
            //                .foregroundStyle(Color.main700)
        }
    }
}

