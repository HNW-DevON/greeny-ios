//
//  PointApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

fileprivate let client = GreenyHttpClient.live

final class PointApi {
    
    func savePoint(id: Int) async throws -> VoidResponse {
        try await client.request("/point/get/\(id)", VoidResponse.self)
    }
    
}

extension PointApi {
    static let live = PointApi()
}
