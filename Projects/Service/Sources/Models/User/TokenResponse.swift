//
//  TokenResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct TokenResponse: Decodable {
    public let expireAt: String
    public let token: String
}
