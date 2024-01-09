//
//  GreenyTopbar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

struct GreenyTopbar<Content>: View where Content: View {
    
    var backButtonCallback: (() -> Void)?
    var title: String
    @ViewBuilder var content: () -> Content
    
    init(backButtonCallback: (() -> Void)? = nil,
         title: String,
         content: @escaping () -> Content) {
        self.backButtonCallback = backButtonCallback
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                if backButtonCallback != nil {
                    Image("LeftArrow")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .onTapGesture {
                            backButtonCallback!()
                        }
                        .padding(.leading, 16)
                }
                Text(title)
                    .font(._subtitle)
                    .padding(.leading, 16)
                Spacer()
            }
            content()
        }
    }
}
