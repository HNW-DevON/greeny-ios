//
//  JoinRequest.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct JoinRequest: Encodable {
    public let username: String
    public let password: String
    public let name: String
    public let birth: String
}
