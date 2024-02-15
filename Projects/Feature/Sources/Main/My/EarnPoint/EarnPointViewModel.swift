//
//  EarnPointViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/15/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Service
import Alamofire

fileprivate let companyApi = CompanyApi.live

@MainActor
final class EarnPointViewModel: ObservableObject {
    
    @Published var todayCompanies: Companies = []
    @Published var isLoading = true
    
    func loadCompanies(onFail: @escaping () -> Void) async {
        isLoading = true
        do {
            todayCompanies = try await companyApi.todayCompany()
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                print(e)
            }
        } catch {
            print(error)
        }
        isLoading = false
    }
    
}
