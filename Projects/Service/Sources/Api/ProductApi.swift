//
//  ProductApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

fileprivate let client = GreenyHttpClient.live

final class ProductApi {
    func find() async throws -> [ProductResponse] {
        try await client.request("/find", [ProductResponse].self)
    }
    
    func product(id: Int) async throws -> ProductResponse {
        try await client.request("/product/\(id)", ProductResponse.self)
    }
}
