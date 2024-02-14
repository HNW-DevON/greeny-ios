//
//  PointCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import Service

struct PointCeil: View {
    
    var point: Point
    var beforeSame: Bool
    
    var body: some View {
        VStack {
            if !beforeSame {
                Text("\(point.addedAt)")
                    .foregroundStyle(Color.gray400)
                    .font(._bodyLight)
                    .toLeading()
            }
            HStack {
                Image(point.point >= 0 ? "EarningPoint" : "PayPoint")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .padding(8)
                    .background(Color.gray100)
                    .clipShape(Circle())
                Text("\(point.point >= 0 ? "+" : "-")\(point.point)P")
                    .padding(.leading, 12)
                Spacer()
            }
        }
    }
}
