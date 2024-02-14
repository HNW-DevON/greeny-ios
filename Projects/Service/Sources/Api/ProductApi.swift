//
//  ProductApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

fileprivate let client = GreenyHttpClient.live

public final class ProductApi {
    public func find() async throws -> [Product] {
        try await client.request("/find", [ProductResponse].self).map { $0.toDomain() }
    }
    
    public func product(id: Int) async throws -> Product {
        try await client.request("/product/\(id)", ProductResponse.self).toDomain()
    }
}

extension ProductApi {
    public static let live = ProductApi()
}
