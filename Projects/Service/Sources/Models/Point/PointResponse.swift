//
//  PointResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct PointResponse: Decodable {
    public let id: Int
    public let point: Int
    public let productId: String
    public let addedAt: String
}

extension PointResponse {
    public func toDomain() -> Point {
        Point(id: id,
              point: point,
              productId: productId,
              addedAt: Date.fromString(addedAt))
    }
}
