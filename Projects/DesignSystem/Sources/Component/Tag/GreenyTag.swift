//
//  GreenyTag.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

public struct GreenyTag: View {
    
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color
    
    public init(_ text: String,
         foregroundColor: Color,
         backgroundColor: Color
    ) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    public var body: some View {
        Text(text)
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
            .foregroundStyle(foregroundColor)
            .background(backgroundColor)
    }
}
