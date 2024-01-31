//
//  TodayCompanyCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct TodayCompanyCeil: View {
    
    let productName: String
    let imageUrl: String
    let description: String
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: imageUrl),
                content: {
                    $0.image?
                        .resizable()
                        .frame(width: 64, height: 64)
                        .addGrayStroke()
                }
            )
            VStack {
                Spacer()
                Text(productName)
                    .font(._body)
                    .toLeading()
                Spacer()
                Text(description)
                    .font(._label)
                    .toLeading()
                Spacer()
            }
            .padding(.leading, 12)
            Spacer()
            GreenyTag("asd", foregroundColor: .green500, backgroundColor: .green)
        }
    }
}
