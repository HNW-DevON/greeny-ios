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
    @State var pw: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GreenyTopbar("로그인") {
            dismiss()
        } content: {
            VStack(spacing:0) {
                GreenyInputCeil(title: "아이디", hint: "아이디를 입력해 주세요", text: $id)
                    .padding([.bottom, .top], 32)
                    .padding(.horizontal, 20)
                GreenyInputCeil(textFieldType: .password, title: "비밀번호", hint: "비밀번호를 입력해 주세요", text: $pw)
                    .padding(.horizontal, 20)
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
                
                HStack(spacing: 0) {
                    Text("아직 계정이 없으시다면? ")
                        .font(._caption)
                    NavigationLink {
                        JoinFirstView()
                    } label: {
                        Text("회원가입")
                            .foregroundStyle(Color.main600)
                            .font(._caption)
                    }
                }
                .padding(.bottom, 16)
                GreenyButton("로그인") {}
                    .padding(.bottom, 16)
                    .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
