//
//  CertificationView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

struct CertificationView: View {
    
    @ObservedObject var vm = CertificationViewModel()
    @Binding var isClicked: Bool
    
    
    var body: some View {
        BarcodeScannerView(barcode: $vm.barcode)
        
        NavigationLink(isActive: $isClicked) {
            if vm.barcode != nil {
                ResultView(barcode: vm.barcode!)
            } else {
                Sorry()
            }
        } label: {
            
        }
    }
}

struct Sorry: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GreenyTopbar("") {
            dismiss()
        } content: {
            VStack {
                Spacer()
                Text("마음이 너무 급한 당신!\n아직 바코드가 인식되지 않았어요")
                    .multilineTextAlignment(.center)
                    .font(._title)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}
