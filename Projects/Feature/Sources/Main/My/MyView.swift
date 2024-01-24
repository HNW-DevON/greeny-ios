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
    
    private let roundedCorner = RoundedCorner(radius: Size.extraLarge.rawValue)
    
    @State private var levelGauge = 0.4
    @State private var rect: CGRect = .zero
    
    private let data = (1...30).map { "상품 \($0)" }
    private let gridItem = [GridItem(.flexible(minimum: 50)),
                            GridItem(.flexible(minimum: 50)),
                            GridItem(.flexible(minimum: 50)),
                            GridItem(.flexible(minimum: 50))]
    
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
                            .padding(.trailing, 12)
                    }
                }
            }
            HStack(spacing: 8) {
                GreenyButton("혜택보기", buttonType: .gray) {
                    
                }
                GreenyButton("포인트 얻는 법", buttonType: .gray) {
                    
                }
            }
            .frame(height: 32)
            .padding(.horizontal, 8)
            .padding(.bottom, 12)
        }
        
        .overlay {
            roundedCorner
                .stroke(Color.gray100, lineWidth: 2)
        }
        .clipShape(roundedCorner)
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    var level: some View {
        VStack {
            HStack {
                Text("레벨")
                    .font(._body)
                    .padding(12)
                Spacer()
                Button {
                    print("mv to level detail")
                } label: {
                    Image(Asset.leftArrow)
                        .resizable()
                        .renderingMode(.template)
                        .frame(maxWidth: 18, maxHeight: 18)
                        .foregroundStyle(Color.gray500)
                        .scaleEffect(x: -1, y: 1)
                        .padding(.leading, 12)
                        .padding(.trailing, 12)
                }
            }
            VStack(spacing: 4) {
                HStack(alignment: .bottom, spacing: 8) {
                    Image(Asset.seed)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(.bottom, 8)
                    Text("씨앗")
                        .foregroundStyle(Color.main500)
                        .font(._subtitle)
                        .padding(.bottom, 8)
                    Spacer()
                    Text("착소 새싹")
                        .foregroundStyle(Color.gray500)
                        .font(._label)
                        .padding(.trailing, 4)
                }
                .padding(.top, 8)
                Gauge(value: levelGauge) {
                }
                .tint(.main500)
                .accentColor(.gray100)
                .frame(height: 8.0)
                .scaleEffect(x: 1, y: 0.5, anchor: .center)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 12)
        }
        .overlay {
            roundedCorner
                .stroke(Color.gray100, lineWidth: 2)
        }
        .clipShape(roundedCorner)
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    var encyclopedia: some View {
        LazyVGrid(columns: gridItem) {
            ForEach(data, id: \.self) {
                Text($0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
        }
    }
    
//    @ViewBuilder
//    var tabViewIndicator: some View {
//        
//    }
    
    @ViewBuilder
    var tabViewContent: some View {
        TabView {
            encyclopedia
                .frame(maxWidth: .infinity)
                .background(GeometryReader {
                    Color.clear.preference(key: ViewRectKey.self,
                                           value: [$0.frame(in: .local)])
                })
                .tag(0)
            Text("Hello")
                .tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: rect.size.height + 60)
        .onPreferenceChange(ViewRectKey.self) { rects in
            if rects.first?.height ?? .zero > rect.height {
                rect = rects.first ?? .zero
            }
        }
    }
    
    var body: some View {
        GreenyTopbar("MY") {
            ScrollView {
                VStack {
                    profile
                    point.padding(.top, 16)
                    level.padding(.top, 12)
                    tabViewIndicator
                    tabViewContent
                }
            }
        }
    }
}

public struct ViewRectKey: PreferenceKey {
    public typealias Value = Array<CGRect>
    public static var defaultValue = [CGRect]()
    public static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
