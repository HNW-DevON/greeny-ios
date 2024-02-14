//
//  FindApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

fileprivate let client = GreenyHttpClient.live

public final class FindApi {
    public func find() async throws -> [Product] {
        try await client.request("/find", [ProductResponse].self).map { $0.toDomain() }
    }
    
    public func daily() async throws -> [Product] {
        try await client.request("/find/daily", [ProductResponse].self).map { $0.toDomain() }
    }
}


extension FindApi {
    public static let live = FindApi()
}
