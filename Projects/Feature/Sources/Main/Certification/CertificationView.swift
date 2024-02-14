//
//  CertificationView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

struct CertificationView: View {
    
    @ObservedObject var vm = CertificationViewModel()
    @Binding var isClicked: Bool

    
    var body: some View {
        CertificationCameraView(viewModel: vm)
            .onChange(of: isClicked) {
                if $0 {
                    let _ = withAnimation {
                        Task {
                            await vm.capturePhoto()
                        }
                    }
                    isClicked = false
                }
            }
        NavigationLink(isActive: $vm.isActive) {
            ResultView(recentImage: vm.recentImage!)
        } label: {
            
        }
    }
}
