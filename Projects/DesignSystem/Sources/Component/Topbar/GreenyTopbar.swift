//
//  GreenyTopbar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

public struct GreenyTopbar<Content>: View where Content: View {
    
    var backButtonCallback: (() -> Void)?
    var title: String
    @ViewBuilder var content: () -> Content
    
    public init(_ title: String,
                backButtonCallback: (() -> Void)? = nil,
                content: @escaping () -> Content) {
        self.backButtonCallback = backButtonCallback
        self.title = title
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                if backButtonCallback != nil {
                    Button {
                        backButtonCallback!()
                    } label: {
                        Image(Asset.leftArrow)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.leading, 16)
                    }
                }
                Text(title)
                    .font(._subtitle)
                    .padding(.leading, 16)
                Spacer()
            }
            .frame(maxHeight: 48)
            content()
            Spacer()
        }
    }
}
