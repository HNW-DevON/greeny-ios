//
//  EncycloPediaResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct EncycloPediaResponse: Decodable {
    let id: Int
    let productId: String
    let username: String
    let addedAt: String
}

public typealias EncycloPediasResponse = [EncycloPediaResponse]

extension EncycloPediaResponse {
    
    func toDomain() -> EncycloPedia {
        EncycloPedia(id: id,
                     productId: productId,
                     username: username,
                     addedAt: Date.fromString(addedAt))
    }
    
}
