//
//  JoinRequest.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

struct JoinRequest: Encodable {
    let username: String
    let password: String
    let name: String
    let birth: String
}
