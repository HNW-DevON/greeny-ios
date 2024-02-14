//
//  FindViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Service
import Foundation
import Alamofire

fileprivate let productApi = ProductApi.live
fileprivate let findApi = FindApi.live

@MainActor
final class FindViewModel: ObservableObject {
    
    @Published var leftProducts: [Product] = []
    @Published var rightProducts: [Product] = []
    @Published var isLoading = true
    
    func loadFind(onFail: () -> Void) async {
        do {
            debugPrint("findvm - loading")
            let products = try await findApi.find()
            let center = products.count / 2
            debugPrint("findvm - loaded")
            leftProducts = Array(Array(products)[0..<center])
            rightProducts = Array(Array(products)[center..<products.count])
            isLoading = false
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
            isLoading = false
        } catch {
            isLoading = false
        }
    }
}
