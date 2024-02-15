//
//  CertificationResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/15/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct CertificationResponse: Decodable {
    public let count: Int
    public let product: ProductResponse
}

extension CertificationResponse {
    public func toDomain() -> Certification {
        Certification(count: count,
                      product: product.toDomain())
    }
}
