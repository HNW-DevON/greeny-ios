//
//  CompanyResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct CompanyResponse: Decodable {
    public let id: Int
    public let companyName: String
    public let companyDesc: String
    public let companyCategory: [String]
    public let event: [EventResponse]
}

public typealias CompaniesResponse = [CompanyResponse]

extension CompanyResponse {
    func toDomain() -> Company {
        Company(id: id,
                companyName: companyName,
                companyDesc: companyDesc,
                companyCategory: companyCategory,
                event: event.map { $0.toDomain() })
    }
}
