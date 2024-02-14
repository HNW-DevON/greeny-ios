//
//  CompanyApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

public final class CompanyApi {
    
    public func getCompanyAll() async throws -> Companies {
        try await AF.request("/company", method: .get).serializingDecodable(CompaniesResponse.self).value.map { $0.toDomain() }
    }
    
    public func getCompany(id: String) async throws -> Company {
        try await AF.request("/company/\(id)", method: .get).serializingDecodable(CompanyResponse.self).value.toDomain()
    }
    
    public func getCompanyByCategory(category: String) async throws -> Companies {
        try await AF.request("/company/category/\(category)", method: .get).serializingDecodable(CompaniesResponse.self).value.map { $0.toDomain() }
    }
    
}

extension CompanyApi {
    public static let live = CompanyApi()
}
