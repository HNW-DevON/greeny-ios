//
//  CompanyApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

final class CompanyApi {
    
    func getCompanyAll() async throws -> CompaniesResponse {
        try await AF.request("/company", method: .get).serializingDecodable(CompaniesResponse.self).value
    }
    
    func getCompany(id: String) async throws -> CompanyResponse {
        try await AF.request("/company/\(id)", method: .get).serializingDecodable(CompanyResponse.self).value
    }
    
    func getCompanyByCategory(category: String) async throws -> CompaniesResponse {
        try await AF.request("/company/category/\(category)", method: .get).serializingDecodable(CompaniesResponse.self).value
    }
    
}

extension CompanyApi {
    static let live = CompanyApi()
}
