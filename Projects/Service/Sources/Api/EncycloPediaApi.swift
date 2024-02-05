//
//  EncycloPediaApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

final class EncycloPediaApi {
    
    func getEncyclePediaAll() async throws -> EncycloPediasResponse {
        try await AF.request("/pedia", method: .get).serializingDecodable(EncycloPediasResponse.self).value
    }
    
}

extension EncycloPediaApi {
    static let live = EncycloPediaApi()
}
