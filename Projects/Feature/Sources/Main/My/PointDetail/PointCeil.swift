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
            }
            HStack {
                Spacer()
            }
        }
    }
}
