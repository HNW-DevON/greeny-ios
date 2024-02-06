//
//  EventResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct EventResponse: Decodable {
    public let id: Int
    public let eventName: String
    public let eventDesc: String
    public let company: CompanyResponse
}

public typealias EventsResponse = [EventResponse]
