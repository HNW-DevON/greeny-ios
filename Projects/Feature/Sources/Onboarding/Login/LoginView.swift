//
//  LoginView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct LoginView: View {
    
    @State var id: String = ""
    
    var body: some View {
        VStack(spacing:0) {
            GreenyInputCeil(title: "아이디", hint: "아이디를 입력해 주세요", text: $id)
                .padding([.bottom, .top], 32)
            GreenyInputCeil(title: "비밀번호", hint: "비밀번호를 입력해 주세요", text: $id)
            HStack {
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("비밀번호 찾기")
                        .foregroundStyle(Color.gray500)
                        .font(._caption)
                        .underline()
                        .padding([.top], 4)
                        .padding([.trailing], 24)
                }
                
            }
            Spacer()
            
            GreenyButton("로그인") {}
                .padding(.bottom, 16)
            
        }
    }
}
