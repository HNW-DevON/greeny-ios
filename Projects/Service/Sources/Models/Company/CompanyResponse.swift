//
//  CompanyResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

struct CompanyResponse: Decodable {
    let id: Int
    let companyName: String
    let companyDesc: String
    let companyCategory: [String]
}

typealias CompaniesResponse = [CompanyResponse]
