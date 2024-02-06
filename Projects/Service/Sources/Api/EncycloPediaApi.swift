//
//  EncycloPediaApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

public final class EncycloPediaApi {
    
    private let client = GreenyHttpClient()
    
    public func getEncyclePediaAll() async throws -> EncycloPedias {
        try await client.request("/pedia", EncycloPediasResponse.self).map { $0.toDomain() }
    }
    
}

extension EncycloPediaApi {
    public static let live = EncycloPediaApi()
}
