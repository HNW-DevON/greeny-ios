//
//  Company.swift
//  Service
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct Company: Hashable {
    public let id: Int
    public let companyName: String
    public let companyDesc: String
    public let companyCategory: [String]
    public let event: [Event]
}

public typealias Companies = [Company]

