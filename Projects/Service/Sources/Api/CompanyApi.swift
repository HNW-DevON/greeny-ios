//
//  CompanyApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

fileprivate let client = GreenyHttpClient.live

public final class CompanyApi {
    
    public func getCompanyAll() async throws -> Companies {
        try await client.request("/company", CompaniesResponse.self).map { $0.toDomain() }
    }
    
    public func getCompany(id: String) async throws -> Company {
        try await client.request("/company/\(id)", CompanyResponse.self).toDomain()
    }
    
    public func getCompanyByCategory(category: String) async throws -> Companies {
        try await client.request("/company/category/\(category)", CompaniesResponse.self).map { $0.toDomain() }
    }
    
}

extension CompanyApi {
    public static let live = CompanyApi()
}
