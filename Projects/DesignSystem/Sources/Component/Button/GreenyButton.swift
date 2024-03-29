//
//  AlimoButton.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public struct GreenyButton: View {
    
    var text: String
    var buttonType: GreenyButtonType
    var callback: () -> Void
    var height: CGFloat
    
    public init(_ text: String,
                buttonType: GreenyButtonType = .main,
                height: CGFloat = 52,
                callback: @escaping () -> Void) {
        self.text = text
        self.buttonType = buttonType
        self.callback = callback
        self.height = height
    }
    
    public var body: some View {
        Button {
            callback()
        } label: {
            Text(text)
                .font(._body)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .foregroundStyle(buttonType.foregroundColor)
                .background(buttonType.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
        }
    }
}
