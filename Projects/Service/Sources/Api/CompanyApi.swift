//
//  CompanyApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

final class CompanyApi {
    
    func getCompanyAll() async throws -> Companies {
        try await AF.request("/company", method: .get).serializingDecodable(CompaniesResponse.self).value.map { $0.toDomain() }
    }
    
    func getCompany(id: String) async throws -> Company {
        try await AF.request("/company/\(id)", method: .get).serializingDecodable(CompanyResponse.self).value.toDomain()
    }
    
    func getCompanyByCategory(category: String) async throws -> Companies {
        try await AF.request("/company/category/\(category)", method: .get).serializingDecodable(CompaniesResponse.self).value.map { $0.toDomain() }
    }
    
}

extension CompanyApi {
    static let live = CompanyApi()
}
