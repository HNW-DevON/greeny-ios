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
    
    @State private var rect: CGRect = .zero
    @State private var selectedTab = MyTabViewType.Encyclopedia
    @EnvironmentObject var tm: TokenManager
    
    // 4칸
    private let gridItem = [GridItem(.flexible(minimum: 50)),
                            GridItem(.flexible(minimum: 50)),
                            GridItem(.flexible(minimum: 50)),
                            GridItem(.flexible(minimum: 50))]
    
    @StateObject var vm = MyViewModel()
    
    @ViewBuilder
    var profile: some View {
        HStack {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: vm.user?.imagePath ?? "")) {
                    $0.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 48, maxHeight: 48)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundStyle(Color.gray100)
                        .frame(maxWidth: 48, maxHeight: 48)
                        .clipShape(Circle())
                }
                .padding(.leading, 16)
                Text(vm.user?.name ?? "")
                    .font(._label)
                Text(vm.user?.tier ?? "")
                    .font(._caption)
                    .foregroundStyle(Color.yellow)
            }
            Spacer()
            NavigationLink {
                MyEditView(fixName: $vm.fixName) {
                    await vm.editProfile {
                        withAnimation {
                            tm.token = ""
                        }
                    }
                }
            } label: {
                Text("설정")
                    .padding(.trailing, 12)
                    .font(._caption)
                    .foregroundStyle(Color.gray500)
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
                NavigationLink {
                    PointDetailView()
                } label: {
                    HStack {
                        Image(Asset.greeny)
                            .resizable()
                            .frame(maxWidth: 16, maxHeight: 16)
                        Text("\(vm.user?.hasPoint ?? 0)P")
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
                NavigationLink {
                    BenefitView()
                } label: {
                    GreenyButton("혜택보기", buttonType: .gray) {}.disabled(true)
                }
                
                NavigationLink {
                    EarnPointView()
                } label: {
                    GreenyButton("포인트 얻는 법", buttonType: .gray) {}.disabled(true)
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
                Text("티어")
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
                    Text(vm.tier)
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
                Gauge(value: (Double(vm.left) / 100.0)) {
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
        LazyVGrid(columns: gridItem, spacing: 16) {
            ForEach(vm.encyclopedias, id: \.id) {
                EncyclopediaCeil(imageUrl: "https://hws.dev/paul.jpg", productName: $0.username)
                    .onTapGesture {
                        print("clicked \($0)")
                    }
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    var tabViewIndicator: some View {
        HStack(spacing: 0) {
            ForEach(MyTabViewType.allCases, id: \.self) { i in
                
                let imageColor = i == selectedTab ? Color.main600 : Color.gray400
                let dividerColor = i == selectedTab ? Color.main600 : Color.gray100
                
                VStack(spacing: 4) {
                    Button {
                        selectedTab = i
                    } label: {
                        Image(i.image)
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 32, height: 32)
                            .foregroundStyle(imageColor)
                    }
                    Divider()
                        .frame(height: 1)
                        .background(dividerColor)
                }
            }
        }
    }
    
    @ViewBuilder
    var tabViewContent: some View {
        TabView(selection: $selectedTab) {
            encyclopedia
                .frame(maxWidth: .infinity)
                .background(GeometryReader {
                    Color.clear.preference(key: ViewRectKey.self,
                                           value: [$0.frame(in: .local)])
                })
                .tag(MyTabViewType.Encyclopedia)
            Text("Hello")
                .tag(MyTabViewType.Corp)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: rect.size.height + 30)
        .onPreferenceChange(ViewRectKey.self) { rects in
            if rects.first?.height ?? .zero > rect.height {
                rect = rects.first ?? .zero
            }
        }
    }
    
    var body: some View {
        GreenyTopbar("MY") {
            ScrollView {
                VStack(spacing: 0) {
                    profile
                    point.padding(.top, 16)
                    level.padding(.top, 12)
                    tabViewIndicator.padding(.top, 24)
                    tabViewContent
                }
            }
        }
        .task {
            await vm.loadEncyclopedia {
                tm.token = ""
            }
            await vm.loadPoint {
                tm.token = ""
            }
            await vm.loadUserInfo {
                tm.token = ""
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
