//
//  MyEditView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/25/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MyEditView: View {
    
    @State private var name = ""
    @State private var id = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var tm: TokenManager
    
    var body: some View {
        GreenyTopbar("설정", backButtonCallback: {
            dismiss()
        }) {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"),
                           content: {
                    $0.image?
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }
                )
                .padding(.top, 16)
                GreenyInputCeil(title: "이름", hint: "이름을 입력해 주세요", text: $name)
                    .padding(.horizontal, 20)
                GreenyInputCeil(title: "아이디", hint: "아이디를 입력해 주세요", text: $id)
                    .padding(.horizontal, 20)
                    .padding(.top, 32)
                GreenyButton("로그아웃", buttonType: .red) {
                    withAnimation {
                        tm.token = ""
                    }
                }
                .frame(width: 100, height: 40)
                .padding(.top, 20)
                
                Spacer()
                GreenyButton("저장") {
                    dismiss()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
