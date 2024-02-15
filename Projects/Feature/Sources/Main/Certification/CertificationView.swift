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
        BarcodeScannerView(barcode: $vm.barcode)
        if vm.barcode != nil {
            NavigationLink(isActive: $isClicked) {
                ResultView(barcode: vm.barcode!)
            } label: {
                
            }
        }
    }
}
