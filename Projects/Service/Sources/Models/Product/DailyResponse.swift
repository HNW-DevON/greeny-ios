//
//  DailyResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct DailyResponse: Decodable {
    let username: String
    let addedAt: String
    let product: ProductResponse
}

extension DailyResponse {
    public func toDomain() -> Daily {
        Daily(username: username,
              addedAt: Date.fromString(addedAt),
              product: product.toDomain())
    }
}
