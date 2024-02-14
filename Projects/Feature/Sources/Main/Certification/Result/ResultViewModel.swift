//
//  ResultViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Alamofire
import Service

fileprivate let productApi = ProductApi.live
fileprivate let pointApi = PointApi.live

@MainActor
class ResultViewModel: ObservableObject {
    @Published var viewType: CertificationViewType = .loadingFirst
    @Published var resultProduct: Product? = nil {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.viewType = .result
            }
        }
    }
    
    func loadView(onFail: @escaping () -> Void, onFail2: @escaping () -> Void) async {
        viewType = .loadingFirst
        do {
            let dummyId = 8801045023687
            resultProduct = try await productApi.product(id: 8801045023687)
            let _ = try await pointApi.savePoint(id: 8801045023687)
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch (let e) {
            onFail2()
            print(e)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewType = .loadingSecond
        }
    }
}
