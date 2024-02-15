//
//  ProductDetail.swift
//  Feature
//
//  Created by dgsw8th71 on 2/15/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem
import Service

struct ProductDetail: View {
    
    @Environment(\.dismiss) var dismiss
    
    var product: Product
    
    var body: some View {
        let size: CGFloat = 300
        GreenyTopbar("상품 상세 정보") {
            dismiss()
        } content: {
            ScrollView {
                VStack(spacing: 0) {
                    AsyncImage(url: URL(string: (product.images?.first ?? "") ?? "")) {
                        $0
                            .resizable()
                            .addGrayStroke()
                            .frame(width: size, height: size)
                    } placeholder: {
                        Rectangle()
                            .foregroundStyle(Color.gray100)
                            .addGrayStroke()
                            .frame(width: size, height: size)
                    }
                    .padding(.top, 44)
                    Text(product.baseItems?.first??.value ?? "")
                        .font(._subtitle)
                        .padding(.top, 12)
                    Text("기업 정보")
                        .font(._title)
                        .toLeading()
                        .padding(.leading, 20)
                        .padding(.top, 24)
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(product.companies ?? [], id: \.?.name) { i in
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(i?.name)
                                        .font(._body)
                                    HStack(alignment: .bottom) {
                                        Text(i?.type)
                                            .font(._caption)
                                            .padding(.top, 8)
                                        Text(i?.addresses?.first ?? "")
                                            .font(._caption)
                                            .padding(.top, 4)
                                    }
                                }
                            }
//                            HStack(spacing: 0) {
//                                Text("환경")
//                                    .foregroundStyle(Color(0x47AF23))
//                                    .font(._cute)
//                            }
//                            .padding(6)
//                            .background(Color(0xCBFFCD))
//                            .clipShape(RoundedCorner(radius: 8))
//                            .padding(.top, 12)
                        }
                        .padding(.top, 4)
                        .toLeading()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
