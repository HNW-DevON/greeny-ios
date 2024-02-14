//
//  CompanyDetailView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CompanyDetailView: View {
    
    let category: String
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = CompanyDetailViewModel()
    @EnvironmentObject var tm: TokenManager
    
    var body: some View {
        GreenyTopbar("\(category)") {
            dismiss()
        } content: {
            LazyVStack {
                ForEach(vm.companies, id: \.self) { i in
                    CompanyDetailCeil(company: i)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            await vm.loadCompanies(category: category) {
                tm.token = ""
            }
        }
    }
}

