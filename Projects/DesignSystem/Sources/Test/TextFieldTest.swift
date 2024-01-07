//
//  TextFieldTest.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public struct TextFieldTest: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    
    public init() {}
    
    public var body: some View {
        VStack {
            GreenyTextField("아이디를 입력하세요", text: $id, textFieldType: .none(hasXMark: false))
            GreenyTextField("아이디를 입력하세요", text: $id)
            GreenyTextField("비밀번호를 입력하세요", text: $pw, textFieldType: .password)
        }
    }
}
