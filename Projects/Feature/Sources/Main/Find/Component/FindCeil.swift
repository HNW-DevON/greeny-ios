//
//  FindCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

struct FindCeil: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"),
                       content: {
                $0.image?
                    .resizable()
                    .addGrayStroke()
                    .frame(maxHeight: CGFloat.random(in: 124...220))
            }
            )
            Text("망고맛치킨")
                .font(._caption)
                .bold()
                .padding(.top, 12)
            Text("제갈치킨")
                .font(._cute)
            Text("오늘 10명의 사용자가 소비하고 있어요")
                .font(._cute)
                .padding(.top, 8)
                .foregroundStyle(Color.main700)
        }
    }
}

