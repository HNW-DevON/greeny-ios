//
//  MyView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct MyView: View {
    
    fileprivate let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue)
    
    @ViewBuilder
    var profile: some View {
        HStack {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"),
                           content: {
                    $0.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 48, maxHeight: 48)
                        .clipShape(Circle())
                }
                )
                    .padding(.leading, 16)
                Text("노자손")
                    .font(._label)
                Text("골드3")
                    .font(._caption)
                    .foregroundStyle(Color.yellow)
            }
            Spacer()
            Text("프로필 수정")
                .padding(.trailing, 4)
                .font(._cute)
                .foregroundStyle(Color.gray500)
                .onTapGesture {
                    print("edit profile")
                }
        }
        .padding(.horizontal, 8)
    }
    
    @ViewBuilder
    var point: some View {
        VStack {
            HStack {
                Text("포인트")
                    .font(._body)
                    .padding(12)
                Spacer()
                Button {
                    print("mv to point detail")
                } label: {
                    HStack {
                        Image(Asset.greeny)
                            .resizable()
                            .frame(maxWidth: 16, maxHeight: 16)
                        Text("120P")
                            .font(._body)
                        Image(Asset.leftArrow)
                            .resizable()
                            .renderingMode(.template)
                            .frame(maxWidth: 18, maxHeight: 18)
                            .foregroundStyle(Color.gray500)
                            .scaleEffect(x: -1, y: 1)
                    }
                }
            }
            HStack(spacing: 8) {
                GreenyButton("Hello", buttonType: .gray) {
                    
                }
                GreenyButton("Hello", buttonType: .gray) {
                    
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 12)
        }
        .padding(.horizontal, 10)
        .overlay {
            roundedCorner
                .stroke(Color.gray100, lineWidth: 1)
        }
        .clipShape(roundedCorner)
    }
    
    var body: some View {
        GreenyTopbar("MY") {
            ScrollView {
                VStack {
                    profile
                    point
                        .padding(.top, 16)
                }
            }
        }
    }
}
