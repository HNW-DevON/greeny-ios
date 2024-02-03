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
                    Text("result")
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            withAnimation {
                vm.loadView()
            }
        }
    }
}

