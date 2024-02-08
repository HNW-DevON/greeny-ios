//
//  FindViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Service
import Foundation

fileprivate let productApi = ProductApi.live

@MainActor
final class FindViewModel: ObservableObject {
    
    @Published var leftProducts: [Product] = []
    @Published var rightProducts: [Product] = []
    
    func loadFind(onFail: () -> Void) async {
        do {
            let products = try await productApi.find()
            let center = products.count / 2
            leftProducts = Array(Array(products)[0..<center])
            rightProducts = Array(Array(products)[center..<products.count])
        } catch (let e) {
            print(e)
            onFail()
        }
    }
}
