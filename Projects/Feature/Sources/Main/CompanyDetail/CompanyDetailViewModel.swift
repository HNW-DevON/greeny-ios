//
//  CompanyDetailViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Service
import Alamofire

fileprivate let companyApi = CompanyApi.live

@MainActor
final class CompanyDetailViewModel: ObservableObject {
    @Published var companies: Companies = []
    
    func loadCompanies(category:String,
                       onFail: @escaping () -> Void) async {
        do {
            companies = try await companyApi.getCompanyByCategory(category: category)
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch (let e) {
            print(e)
        }
    }
}
