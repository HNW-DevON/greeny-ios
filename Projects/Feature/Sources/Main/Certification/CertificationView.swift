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
    
    var body: some View {
        switch vm.viewType {
        case .camera: CertificationCameraView(viewModel: vm)
        case .loadingFirst:
            Text("Loading first")
        case .loadingSecond:
            Text("Loading second")
        case .result:
            Text("Loading result")
        }
    }
}
