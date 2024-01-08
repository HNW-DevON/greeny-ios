//
//  JoinView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct JoinFirstView: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    
    var body: some View {
        VStack(spacing:0) {
            GreenyInputCeil(title: "아이디", hint: "아이디를 입력해 주세요", text: $id)
                .padding([.bottom, .top], 32)
            GreenyInputCeil(textFieldType: .password, title: "비밀번호", hint: "비밀번호를 입력해 주세요", text: $pw)
            Spacer()
            
            HStack(spacing: 0) {
                Text("이미 계정이 있으시다면? ")
                    .font(._caption)
                NavigationLink {
                    LoginView()
                } label: {
                    Text("로그인")
                        .foregroundStyle(Color.main600)
                        .font(._caption)
                }
            }
            .padding(.bottom, 16)
            
            
            GreenyButton("다음으로") {}
                .padding(.bottom, 16)
            
        }
    }
}

