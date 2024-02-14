//
//  ResultViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

fileprivate let 

class ResultViewModel: ObservableObject {
    @Published var viewType: CertificationViewType = .loadingFirst
    
    
    func loadView() {
        viewType = .loadingFirst
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewType = .loadingSecond
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.viewType = .result
        }
    }
}
