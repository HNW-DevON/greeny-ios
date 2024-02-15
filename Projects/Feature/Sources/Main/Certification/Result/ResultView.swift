//
//  ResultView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct ResultView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = ResultViewModel()
    @EnvironmentObject var tm: TokenManager
    
    @State var showDialog = false
    @State var isPointed = false
    
    var barcode: Int
    
    
    @ViewBuilder
    private var product: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: vm.resultProduct?.product.images.first ?? "")) {
                $0
                    .resizable()
                    .frame(width: 150, height: 150)
                    .addGrayStroke()
            } placeholder: {
                Rectangle()
                    .foregroundStyle(Color.gray100)
                    .frame(width: 150, height: 150)
                    .addGrayStroke()
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(vm.resultProduct?.product.baseItems.first?.value ?? "상품 이름을 찾을 수 없어요")
                    .font(._body)
                Text(vm.resultProduct?.product.clsTotalNm)
                    .font(._caption)
                    .padding(.top, 4)
                HStack(spacing: 0) {
                    Text("\(vm.resultProduct?.count ?? 0)")
                        .foregroundStyle(Color.main600)
                        .font(._cute)
                    Text("번 인증된 제품이에요.")
                        .foregroundStyle(Color.gray500)
                        .font(._cute)
                }
                .padding(6)
                .background(Color.gray100)
                .clipShape(RoundedCorner(radius: 8))
                .padding(.top, 12)
            }
            .padding(.top, 4)
            .toLeading()
        }
    }
    
    @ViewBuilder
    private var company: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(vm.resultProduct?.product.companies ?? [], id: \.name) { i in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(i.name)
                            .font(._body)
                        HStack(alignment: .bottom) {
                            Text(i.type)
                                .font(._caption)
                                .padding(.top, 4)
                            Text(i.addresses.first ?? "")
                                .font(._caption)
                                .padding(.top, 4)
                        }
                    }
                }
                HStack(spacing: 0) {
                    Text("환경")
                        .foregroundStyle(Color(0x47AF23))
                        .font(._cute)
                }
                .padding(6)
                .background(Color(0xCBFFCD))
                .clipShape(RoundedCorner(radius: 8))
                .padding(.top, 12)
            }
            .padding(.top, 4)
            .toLeading()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("분석된 결과는...")
                    .font(._title)
                    .toLeading()
                    .padding(.leading, 20)
                product
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                GreenyButton(isPointed ? "포인트 획득 완료" : "30포인트 획득하기!", buttonType: isPointed ? .gray : .main) {
                    showDialog = true
                }
                .padding(.horizontal, 20)
                .padding(.top, 28)
                .disabled(isPointed)
                Text("기업 정보")
                    .font(._title)
                    .toLeading()
                    .padding(.leading, 20)
                    .padding(.top, 24)
                company
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
            }
        }
    }
    
    var body: some View {
        GreenyTopbar("인증", backButtonCallback: vm.viewType == .result ? {
            dismiss()
        } : nil) {
            Group {
                switch vm.viewType {
                case .loadingFirst:
                    LoadingFirstView()
                case .loadingSecond:
                    LoadingSecondView()
                case .result:
                    content
                }
            }
        }
        .alert("30포인트 획득!", isPresented: $showDialog) {
            Button("닫기", role: .cancel) {
                isPointed = true
            }
        } message: {
            Text("사회적 제품을 사용해주셔서 감사합니다")
        }
        .navigationBarBackButtonHidden()
        .task {
            await vm.loadView(barcode: barcode) {
                withAnimation {
                    tm.token = ""
                }
            } onFail2: {
                // to fail view
            }
        }
    }
}

