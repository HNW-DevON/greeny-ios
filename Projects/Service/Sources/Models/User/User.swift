//
//  User.swift
//  Service
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct User: Hashable {
    public let username: String
    public let name: String
    public let birth: String
    public let tier: String
    public let pointHistory: [Point]
    public let imagePath: String?
    public let totalExp: Int
    public let hasPoint: Int
}
