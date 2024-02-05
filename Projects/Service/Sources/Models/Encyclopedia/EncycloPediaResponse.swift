//
//  EncycloPediaResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

struct EncycloPediaResponse: Decodable {
    let id: Int
    let productId: String
    let username: String
    let addedAt: Date
}

typealias EncycloPediasResponse = [EncycloPediaResponse]

