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
                let c = point.addedAt.components
                if let year = c.year,
                   let month = c.month,
                   let day = c.day,
                   let weekday = c.weekday
                {
                    Text("\(year).\(month).\(day).\(Date.요일내놔(from: weekday))요일")
                        .foregroundStyle(Color.gray400)
                        .font(._bodyLight)
                        .toLeading()
                }
            }
            HStack {
                let isPositive = point.point >= 0
                Image(isPositive ? "EarningPoint" : "PayPoint")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .padding(8)
                    .background(Color.gray100)
                    .clipShape(Circle())
                Text("\(isPositive ? "+" : "-") \(point.point)P")
                    .foregroundStyle(isPositive ? Color.main600 : .red)
                    .font(._body)
                    .padding(.leading, 12)
                Spacer()
            }
        }
    }
}
