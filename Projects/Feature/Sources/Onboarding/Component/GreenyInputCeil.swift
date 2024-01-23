//
//  InputCeil.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct GreenyInputCeil: View {
    
    var textFieldType: GreenyTextFieldType
    var title: String
    var hint: String
    @Binding var text: String
    
    init(textFieldType: GreenyTextFieldType = .none(hasXMark: true),
         title: String,
         hint: String,
         text: Binding<String>) {
        self.textFieldType = textFieldType
        self.title = title
        self.hint = hint
        self._text = text
    }
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .font(._subtitle)
                    .padding(.leading, 4)
                Spacer()
            }
            GreenyTextField(hint, text: $text, textFieldType: textFieldType)
        }
    }
}
