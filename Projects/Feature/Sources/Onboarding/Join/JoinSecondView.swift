//
//  JoinView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct JoinSecondView: View {
    
    let id: String
    let pw: String
    
    @State var name: String = ""
    @State var birthday: String = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = JoinSecondViewModel()
    @State var isLoginActive = false
    
    var body: some View {
        GreenyTopbar("회원가입") {
            dismiss()
        } content: {
            VStack(spacing:0) {
                GreenyInputCeil(title: "이름", hint: "이름을 입력해 주세요", text: $name)
                    .padding(.horizontal, 20)
                    .padding([.bottom, .top], 32)
                GreenyInputCeil(title: "생년월일", hint: "생년월일을 입력해 주세요", text: $birthday)
                    .padding(.horizontal, 20)
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
                
                NavigationLink(isActive: $isLoginActive) {
                    LoginView()
                } label: {
                    
                }
                GreenyButton("회원가입") {
                    Task {
                        await vm.join(id: id,
                                      pw: pw,
                                      name: name,
                                      birth: birthday) {
                            isLoginActive = true
                        } onFail: {
                            print("회원가입 실패")
                        }
                    }
                }
                .padding(.bottom, 16)
                .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

