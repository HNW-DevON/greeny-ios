//
//  HomeViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Alamofire
import Service

fileprivate let findApi = FindApi.live

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var daily: [Product] = []
    
    func loadDaily(onFail: @escaping () -> Void) async {
        do {
            daily = try await findApi.daily()
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch (let e) {
            print(e)
        }
    }
}
