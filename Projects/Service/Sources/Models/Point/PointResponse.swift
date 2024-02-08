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
    public let username: String
    public let addedAt: String
}
