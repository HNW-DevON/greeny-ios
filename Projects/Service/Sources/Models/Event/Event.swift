//
//  Event.swift
//  Service
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct Event: Hashable {
    public let id: Int
    public let eventName: String
    public let eventDesc: String
}

public typealias Events = [Event]
