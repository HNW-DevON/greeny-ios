//
//  FindView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/31/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct FindView: View {
    
    @ObservedObject var vm = FindViewModel()
    @EnvironmentObject var tm: TokenManager
    
    @ViewBuilder
    private var search: some View {
        NavigationLink {
            Text("search view")
        } label: {
            HStack {
                Spacer()
                Image(Asset.search)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.gray500)
                    .frame(width: 22, height: 22)
                    .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity, minHeight: 36)
            .addGrayStroke()
            .padding(.horizontal, 16)
        }
    }
    
    @ViewBuilder
    private var findGrid: some View {
        HStack(alignment: .top, spacing: 16) {
            LazyVStack(spacing: 16) {
                ForEach(vm.leftProducts, id: \.id) { item in
                    FindCeil(item: item)
                }
            }
            LazyVStack(spacing: 16) {
                ForEach(vm.rightProducts, id: \.id) { item in
                    FindCeil(item: item)
                }
            }
        }
        .padding(.horizontal, 24)
    }
    
    var body: some View {
        GreenyTopbar("탐색") {
            ScrollView {
                VStack(spacing: 12) {
                    search
                    findGrid
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                await vm.loadFind {
                    print(tm.token)
                    tm.token = ""
                }
            }
        }
    }
}
