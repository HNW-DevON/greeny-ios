//
//  MyViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Service
import Foundation

fileprivate let encyclopediaApi = EncycloPediaApi.live

@MainActor
final class MyViewModel: ObservableObject {
    
    @Published var encyclopedias: EncycloPedias = []
    
    func loadEncyclopedia() async {
        do {
            encyclopedias = try await encyclopediaApi.getEncyclePediaAll()
        } catch (let e) {
            print(e)
        }
    }
    
}
