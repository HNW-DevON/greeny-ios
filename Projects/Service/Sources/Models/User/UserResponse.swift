//
//  UserResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct UserResponse: Decodable {
    public let username: String
    public let name: String
    public let birth: String
    public let tier: String
    public let pointHistory: [PointResponse]
    public let imagePath: String?
    public let totalExp: Int
    public let hasPoint: Int
}

extension UserResponse {
    func toDomain() -> User {
        User(username: username,
             name: name,
             birth: birth,
             tier: tier,
             pointHistory: pointHistory.map { $0.toDomain() }, 
             imagePath: imagePath,
             totalExp: totalExp,
             hasPoint: hasPoint)
    }
}
