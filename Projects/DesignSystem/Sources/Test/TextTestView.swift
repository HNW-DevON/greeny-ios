//
//  TextTestView.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public struct TextTestView: View {
    
    public init() {}
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(dummyText)
                    .font(._title)
                Text(dummyText)
                    .font(._subtitle)
                Text(dummyText)
                    .font(._body)
                Text(dummyText)
                    .font(._bodyLight)
                Text(dummyText)
                    .font(._label)
                Text(dummyText)
                    .font(._caption)
                Text(dummyText)
                    .font(._cute)
                Spacer()
            }
            .padding(.leading, 10)
            Spacer()
        }
    }
}
